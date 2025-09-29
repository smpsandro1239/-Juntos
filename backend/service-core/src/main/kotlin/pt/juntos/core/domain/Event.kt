// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/domain/Event.kt
// Descrição: Entidade Evento
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.math.BigDecimal
import java.time.LocalDateTime

@Table("events")
data class Event(
    @Id
    val id: Long? = null,
    val nome: String,
    val descricao: String,
    val categoria: String,
    val idadeMin: Int,
    val idadeMax: Int,
    val preco: BigDecimal,
    val dataInicio: LocalDateTime,
    val dataFim: LocalDateTime,
    val latitude: Double,
    val longitude: Double,
    val morada: String,
    val cidade: String,
    val distrito: String,
    val lotacaoMaxima: Int? = null,
    val lotacaoAtual: Int = 0,
    val reservaObrigatoria: Boolean = false,
    val urlReserva: String? = null,
    val telefoneReserva: String? = null,
    val ativo: Boolean = true,
    val criadoEm: LocalDateTime = LocalDateTime.now()
)