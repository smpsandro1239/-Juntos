// +JUNTOS
// Ficheiro: src/test/kotlin/pt/juntos/core/PoiRepositoryTest.kt
// Descrição: Testes para PoiRepository
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core

import io.kotest.core.spec.style.FunSpec
import io.kotest.matchers.shouldBe
import io.kotest.matchers.shouldNotBe
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.DynamicPropertyRegistry
import org.springframework.test.context.DynamicPropertySource
import org.testcontainers.containers.PostgreSQLContainer
import org.testcontainers.junit.jupiter.Container
import org.testcontainers.junit.jupiter.Testcontainers
import pt.juntos.core.domain.Poi
import pt.juntos.core.repository.PoiRepository
import reactor.test.StepVerifier
import java.math.BigDecimal

@SpringBootTest
@Testcontainers
class PoiRepositoryTest(
    private val poiRepository: PoiRepository
) : FunSpec({

    companion object {
        @Container
        val postgres = PostgreSQLContainer("postgis/postgis:15-3.3")
            .withDatabaseName("juntos_test")
            .withUsername("test")
            .withPassword("test")

        @JvmStatic
        @DynamicPropertySource
        fun configureProperties(registry: DynamicPropertyRegistry) {
            registry.add("spring.r2dbc.url") { 
                "r2dbc:postgresql://${postgres.host}:${postgres.firstMappedPort}/${postgres.databaseName}" 
            }
            registry.add("spring.r2dbc.username") { postgres.username }
            registry.add("spring.r2dbc.password") { postgres.password }
            registry.add("spring.flyway.url") { postgres.jdbcUrl }
            registry.add("spring.flyway.user") { postgres.username }
            registry.add("spring.flyway.password") { postgres.password }
        }
    }

    test("deve guardar e encontrar POI") {
        val poi = Poi(
            nome = "Parque Infantil Teste",
            descricao = "Parque para testes",
            categoria = "parque",
            idadeMin = 2,
            idadeMax = 10,
            precoMin = BigDecimal.ZERO,
            precoMax = BigDecimal.ZERO,
            latitude = 38.7223,
            longitude = -9.1393,
            morada = "Rua Teste, 123",
            codigoPostal = "1000-001",
            cidade = "Lisboa",
            distrito = "Lisboa"
        )

        StepVerifier.create(poiRepository.save(poi))
            .assertNext { saved ->
                saved.id shouldNotBe null
                saved.nome shouldBe "Parque Infantil Teste"
            }
            .verifyComplete()
    }

    test("deve encontrar POIs próximos por idade") {
        StepVerifier.create(
            poiRepository.findNearbyByAge(
                lat = 38.7223,
                lng = -9.1393,
                raioMetros = 10000,
                idadeMin = 2,
                idadeMax = 8,
                limite = 10
            )
        )
            .expectNextCount(0) // Sem dados de seed ainda
            .verifyComplete()
    }

    test("deve contar POIs ativos") {
        StepVerifier.create(poiRepository.countActive())
            .assertNext { count ->
                count shouldBe 0L // Base de dados limpa
            }
            .verifyComplete()
    }
})