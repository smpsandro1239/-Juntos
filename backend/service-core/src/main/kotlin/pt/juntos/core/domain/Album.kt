
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/domain/Album.kt
// Descrição: Modelo de dados para um Album de fotos
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.OffsetDateTime
import java.util.UUID

@Table("albums")
data class Album(
    @Id
    val id: UUID = UUID.randomUUID(),
    val userId: UUID,
    val title: String,
    val description: String? = null,
    val coverImageUrl: String? = null,
    val createdAt: OffsetDateTime = OffsetDateTime.now(),
    val updatedAt: OffsetDateTime = OffsetDateTime.now()
)
