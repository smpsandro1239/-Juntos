
// +JUNTOS
// Ficheiro: backend/service-core/src/test/kotlin/pt/juntos/core/web/PoiControllerTest.kt
// Descrição: Testes para o PoiController
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.reactive.WebFluxTest
import org.springframework.boot.test.mock.mockito.MockBean
import org.springframework.test.web.reactive.server.WebTestClient
import pt.juntos.core.repository.PoiRepository

@WebFluxTest(PoiController::class)
class PoiControllerTest {

    @Autowired
    private lateinit var webTestClient: WebTestClient

    @MockBean
    private lateinit var poiRepository: PoiRepository

    @Test
    fun `should return all pois`() {
        webTestClient.get().uri("/v1/pois")
            .exchange()
            .expectStatus().isOk
    }
}
