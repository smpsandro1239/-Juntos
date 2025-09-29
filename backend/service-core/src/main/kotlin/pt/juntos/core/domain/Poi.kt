// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/domain/Poi.kt
// Descrição: Entidade POI (Point of Interest)
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.math.BigDecimal
import java.time.LocalDateTime

@Table("pois")
data class Poi(
    @Id
    val id: Long? = null,
    val nome: String,
    val descricao: String,
    val categoria: String,
    val idadeMin: Int,
    val idadeMax: Int,
    val precoMin: BigDecimal,
    val precoMax: BigDecimal,
    val latitude: Double,
    val longitude: Double,
    val morada: String,
    val codigoPostal: String,
    val cidade: String,
    val distrito: String,
    val telefone: String? = null,
    val website: String? = null,
    val email: String? = null,
    val horarioAbertura: String? = null,
    val horarioFecho: String? = null,
    val acessibilidade: Boolean = false,
    val estacionamento: Boolean = false,
    val wc: Boolean = false,
    val cafetaria: Boolean = false,
    val interior: Boolean = false,
    val exterior: Boolean = false,
    val ativo: Boolean = true,
    val criadoEm: LocalDateTime = LocalDateTime.now(),
    val atualizadoEm: LocalDateTime = LocalDateTime.now()
)