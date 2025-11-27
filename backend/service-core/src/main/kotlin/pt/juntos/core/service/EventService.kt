// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/service/EventService.kt
// Descrição: Serviço de gestão de Eventos
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.service

import org.springframework.stereotype.Service
import pt.juntos.core.domain.Event
import pt.juntos.core.repository.EventRepository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.UUID

@Service
class EventService(private val eventRepository: EventRepository) {

    fun getAllEvents(): Flux<Event> {
        return eventRepository.findAll()
    }

    fun getEventById(id: UUID): Mono<Event> {
        return eventRepository.findById(id)
    }

    fun createEvent(event: Event): Mono<Event> {
        return eventRepository.save(event)
    }

    fun updateEvent(id: UUID, event: Event): Mono<Event> {
        return eventRepository.findById(id)
            .flatMap { existing ->
                val updated = existing.copy(
                    nome = event.nome,
                    descricao = event.descricao,
                    categoria = event.categoria,
                    idadeMin = event.idadeMin,
                    idadeMax = event.idadeMax,
                    preco = event.preco,
                    dataInicio = event.dataInicio,
                    dataFim = event.dataFim,
                    latitude = event.latitude,
                    longitude = event.longitude,
                    morada = event.morada,
                    cidade = event.cidade,
                    distrito = event.distrito,
                    lotacaoMaxima = event.lotacaoMaxima,
                    reservaObrigatoria = event.reservaObrigatoria,
                    urlReserva = event.urlReserva,
                    ativo = event.ativo,
                    atualizadoEm = java.time.LocalDateTime.now()
                )
                eventRepository.save(updated)
            }
    }

    fun deleteEvent(id: UUID): Mono<Void> {
        return eventRepository.deleteById(id)
    }
}
