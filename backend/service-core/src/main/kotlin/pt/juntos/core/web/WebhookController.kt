// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/WebhookController.kt
// Descrição: Controller para os webhooks do Stripe
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/v1/webhooks")
class WebhookController {

    @PostMapping("/stripe")
    fun handleStripeWebhook(@RequestBody payload: String): Mono<String> {
        // Lógica para processar o webhook do Stripe
        println("Received Stripe webhook: $payload")
        return Mono.just("{\"status\": \"received\"}")
    }
}
