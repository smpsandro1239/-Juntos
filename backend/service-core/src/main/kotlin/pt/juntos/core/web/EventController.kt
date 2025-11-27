// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/EventController.kt
// Descrição: Controller para os endpoints de Eventos
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import pt.juntos.core.domain.Event
import pt.juntos.core.service.EventService
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.UUID

@RestController
@RequestMapping("/v1/events")
@Tag(name = "Events", description = "Gestão de Eventos")
class EventController(private val eventService: EventService) {

    @GetMapping
    @Operation(summary = "Listar eventos", description = "Retorna todos os eventos")
    fun getAllEvents(): Flux<Event> = eventService.getAllEvents()

    @GetMapping("/{id}")
    @Operation(summary = "Obter evento", description = "Retorna um evento pelo ID")
    fun getEventById(@PathVariable id: UUID): Mono<ResponseEntity<Event>> {
        return eventService.getEventById(id)
            .map { ResponseEntity.ok(it) }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }

    @PostMapping
    @Operation(summary = "Criar evento", description = "Cria um novo evento")
    fun createEvent(@RequestBody event: Event): Mono<ResponseEntity<Event>> {
        return eventService.createEvent(event)
            .map { ResponseEntity.ok(it) }
    }

    @PutMapping("/{id}")
    @Operation(summary = "Atualizar evento", description = "Atualiza um evento existente")
    fun updateEvent(@PathVariable id: UUID, @RequestBody event: Event): Mono<ResponseEntity<Event>> {
        return eventService.updateEvent(id, event)
            .map { ResponseEntity.ok(it) }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Eliminar evento", description = "Elimina um evento")
    fun deleteEvent(@PathVariable id: UUID): Mono<ResponseEntity<Void>> {
        return eventService.deleteEvent(id)
            .then(Mono.just(ResponseEntity.noContent().build<Void>()))
    }
}
