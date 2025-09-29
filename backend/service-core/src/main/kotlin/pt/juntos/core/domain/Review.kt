
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/domain/Review.kt
// Descrição: Modelo de dados para uma Review
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.OffsetDateTime
import java.util.UUID

@Table("reviews")
data class Review(
    @Id
    val id: UUID = UUID.randomUUID(),
    val userId: UUID,
    val entityId: UUID, // Can be a POI or Event
    val entityType: String, // "POI" or "EVENT"
    val rating: Int, // 1 to 5
    val comment: String? = null,
    val createdAt: OffsetDateTime = OffsetDateTime.now()
)
