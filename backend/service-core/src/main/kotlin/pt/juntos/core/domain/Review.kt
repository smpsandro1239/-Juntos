// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/domain/Review.kt
// Descrição: Entidade Review
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("reviews")
data class Review(
    @Id
    val id: Long? = null,
    val userId: Long,
    val poiId: Long? = null,
    val eventId: Long? = null,
    val classificacao: Int, // 1-5
    val comentario: String? = null,
    val acessibilidadeOk: Boolean? = null,
    val estacionamentoOk: Boolean? = null,
    val wcOk: Boolean? = null,
    val urlsFotos: String? = null, // JSON array
    val aprovado: Boolean = false,
    val criadoEm: LocalDateTime = LocalDateTime.now()
)