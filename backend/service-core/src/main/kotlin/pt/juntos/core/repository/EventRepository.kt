
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/repository/EventRepository.kt
// Descrição: Repositório para acesso a dados de Eventos
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.repository

import org.springframework.data.repository.reactive.ReactiveCrudRepository
import pt.juntos.core.domain.Event
import java.util.UUID

interface EventRepository : ReactiveCrudRepository<Event, UUID>
