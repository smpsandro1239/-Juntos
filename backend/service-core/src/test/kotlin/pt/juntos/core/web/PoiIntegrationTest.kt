package pt.juntos.core.web

import com.fasterxml.jackson.databind.ObjectMapper
import org.junit.jupiter.api.AfterAll
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.TestInstance
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.r2dbc.core.DatabaseClient
import org.springframework.test.context.DynamicPropertyRegistry
import org.springframework.test.context.DynamicPropertySource
import org.springframework.test.web.reactive.server.WebTestClient
import org.testcontainers.containers.PostgreSQLContainer
import org.testcontainers.containers.GenericContainer
import org.testcontainers.utility.DockerImageName
import reactor.kotlin.core.publisher.toMono

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class PoiIntegrationTest {

    companion object {
        private val postgres = PostgreSQLContainer("postgres:15-alpine").apply {
            withDatabaseName("juntos")
            withUsername("test")
            withPassword("test")
            start()
        }

        private val redis = GenericContainer(DockerImageName.parse("redis:7-alpine")).apply {
            withExposedPorts(6379)
            start()
        }

        @JvmStatic
        @DynamicPropertySource
        fun props(registry: DynamicPropertyRegistry) {
            registry.add("spring.r2dbc.url") { "r2dbc:postgresql://${postgres.host}:${postgres.firstMappedPort}/${postgres.databaseName}" }
            registry.add("spring.r2dbc.username") { postgres.username }
            registry.add("spring.r2dbc.password") { postgres.password }

            registry.add("spring.datasource.url") { "jdbc:postgresql://${postgres.host}:${postgres.firstMappedPort}/${postgres.databaseName}" }
            registry.add("spring.redis.host") { redis.host }
            registry.add("spring.redis.port") { redis.firstMappedPort }
        }
    }

    @Autowired
    lateinit var client: WebTestClient

    @Autowired
    lateinit var db: DatabaseClient

    @Autowired
    lateinit var objectMapper: ObjectMapper

    @BeforeAll
    fun setup() {
        // criar tabela minima e inserir alguns POIs para testes
        val schemaSql = this::class.java.getResource("/db/migration/V5__complete_schema.sql").readText()
        db.sql(schemaSql).then().block()

        // inserir alguns POIs
        val inserts = listOf(
            "INSERT INTO juntos.pois (id, nome, descricao, categoria, idade_min, idade_max, preco_min, preco_max, latitude, longitude, morada, codigo_postal, cidade, distrito, acessibilidade, estacionamento, wc, interior, exterior, ativo, criado_em) VALUES (1, 'Parque A', 'Parque para crianças', 'Parque', 0, 12, 0, 0, 38.7223, -9.1393, 'Rua A', '1000-001', 'Lisboa', 'Lisboa', true, true, true, true, true, true, now())",
            "INSERT INTO juntos.pois (id, nome, descricao, categoria, idade_min, idade_max, preco_min, preco_max, latitude, longitude, morada, codigo_postal, cidade, distrito, acessibilidade, estacionamento, wc, interior, exterior, ativo, criado_em) VALUES (2, 'Museu B', 'Museu interactivo', 'Museu', 3, 10, 5, 10, 38.7376, -9.1375, 'Rua B', '1000-002', 'Lisboa', 'Lisboa', false, false, true, true, false, true, now())",
+            "INSERT INTO juntos.pois (id, nome, descricao, categoria, idade_min, idade_max, preco_min, preco_max, latitude, longitude, morada, codigo_postal, cidade, distrito, acessibilidade, estacionamento, wc, interior, exterior, ativo, criado_em) VALUES (3, 'Centro C', 'Centro cultural', 'Cultura', 5, 15, 10, 20, 38.7167, -9.1390, 'Rua C', '1000-003', 'Lisboa', 'Lisboa', true, false, true, true, false, true, now())"
        )

        inserts.forEach { sql -> db.sql(sql).then().block() }
    }

    @AfterAll
    fun tearDown() {
        db.sql("DROP SCHEMA IF EXISTS juntos CASCADE").then().block()
        postgres.stop()
        redis.stop()
    }

    @Test
    fun `paginated returns items and meta`() {
        client.get().uri("/v1/pois/paginated?page=0&size=2")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.items.length()").isEqualTo(2)
            .jsonPath("$.page").isEqualTo(0)
            .jsonPath("$.size").isEqualTo(2)
            .jsonPath("$.total").isEqualTo(3)
    }

    @Test
    fun `filter by category`() {
        client.get().uri("/v1/pois/paginated?page=0&size=10&categoria=Museu")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.items[0].categoria").isEqualTo("Museu")
    }

    @Test
    fun `filter by search term`() {
        client.get().uri("/v1/pois/paginated?page=0&size=10&q=Parque")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.items[0].nome").isEqualTo("Parque A")
    }

    @Test
    fun `filter by idade range`() {
        client.get().uri("/v1/pois/paginated?page=0&size=10&idadeMin=4&idadeMax=12")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.items.length()").isEqualTo(2)
    }

    @Test
    fun `cache hit and invalidation on delete`() {
        // primeira chamada -> populate cache
        client.get().uri("/v1/pois/paginated?page=0&size=10&q=Parque")
            .exchange()
            .expectStatus().isOk

        // delete POI 1
        client.delete().uri("/v1/pois/1").exchange().expectStatus().isNoContent

        // depois do delete, a mesma query já não deve retornar o mesmo total
        client.get().uri("/v1/pois/paginated?page=0&size=10&q=Parque")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.total").isEqualTo(2)
    }

    @Test
    fun `ordenacao por distancia retorna mais proximo primeiro`() {
        // fazer request com lat/lng perto de Parque A (38.7223,-9.1393)
        client.get().uri("/v1/pois/paginated?page=0&size=10&lat=38.7223&lng=-9.1393")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.items[0].nome").isEqualTo("Parque A")
    }

    @Test
    fun `combinacao de filtros retorna corretamente`() {
        client.get().uri("/v1/pois/paginated?page=0&size=10&q=Centro&categoria=Cultura&idadeMin=5&idadeMax=16")
            .exchange()
            .expectStatus().isOk
            .expectBody()
            .jsonPath("$.items.length()").isEqualTo(1)
            .jsonPath("$.items[0].nome").isEqualTo("Centro C")
    }
}
