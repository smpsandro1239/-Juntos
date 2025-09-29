
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/domain/Poi.kt
// Descrição: Modelo de dados para um Ponto de Interesse (POI)
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.OffsetDateTime
import java.util.UUID

@Table("pois")
data class Poi(
    @Id
    val id: UUID = UUID.randomUUID(),
    val name: String,
    val description: String,
    val latitude: Double,
    val longitude: Double,
    val address: String,
    val city: String,
    val postalCode: String,
    val country: String = "PT",
    val website: String? = null,
    val phone: String? = null,
    val price: Double? = 0.0,
    val minAge: Int? = 0,
    val maxAge: Int? = 99,
    val indoor: Boolean = false,
    val createdAt: OffsetDateTime = OffsetDateTime.now(),
    val updatedAt: OffsetDateTime = OffsetDateTime.now()
)
