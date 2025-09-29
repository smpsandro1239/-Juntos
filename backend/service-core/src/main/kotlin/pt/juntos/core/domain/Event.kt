
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/domain/Event.kt
// Descrição: Modelo de dados para um Evento
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.OffsetDateTime
import java.util.UUID

@Table("events")
data class Event(
    @Id
    val id: UUID = UUID.randomUUID(),
    val name: String,
    val description: String,
    val poiId: UUID? = null, // Can be linked to a POI or be a standalone event
    val startDate: OffsetDateTime,
    val endDate: OffsetDateTime,
    val price: Double? = 0.0,
    val createdAt: OffsetDateTime = OffsetDateTime.now(),
    val updatedAt: OffsetDateTime = OffsetDateTime.now()
)
