// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/RankController.kt
// Descrição: Controller para o endpoint de ranking personalizado
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/v1/rank")
class RankController {

    @PostMapping
    fun getRankedPois(@RequestBody features: Map<String, Any>): Mono<String> {
        // Lógica para chamar o serviço de ML e retornar os POIs ordenados
        println("Received ranking request with features: $features")
        return Mono.just("{\"ranked_pois\": []}")
    }
}
