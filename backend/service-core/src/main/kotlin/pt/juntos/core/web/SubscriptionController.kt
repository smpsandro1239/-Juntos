// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/SubscriptionController.kt
// Descrição: Controller para os endpoints de Subscrição
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/v1/subscriptions")
class SubscriptionController {

    @PostMapping("/subscribe")
    fun subscribe(): Mono<String> {
        // Lógica para criar uma sessão de checkout do Stripe
        return Mono.just("{\"checkout_url\": \"https://stripe.checkout.url\"}")
    }
}
