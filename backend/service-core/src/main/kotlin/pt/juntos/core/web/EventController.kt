
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/EventController.kt
// Descrição: Controller para os endpoints de Eventos
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.springframework.web.bind.annotation.*
import pt.juntos.core.domain.Event
import pt.juntos.core.repository.EventRepository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.UUID

@RestController
@RequestMapping("/v1/events")
class EventController(private val eventRepository: EventRepository) {

    @GetMapping
    fun getAllEvents(): Flux<Event> = eventRepository.findAll()

    @GetMapping("/{id}")
    fun getEventById(@PathVariable id: UUID): Mono<Event> = eventRepository.findById(id)

    @PostMapping
    fun createEvent(@RequestBody event: Event): Mono<Event> = eventRepository.save(event)
}
