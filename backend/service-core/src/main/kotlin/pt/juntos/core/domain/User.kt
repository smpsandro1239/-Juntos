// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/domain/User.kt
// Descrição: Entidade Utilizador
// Autor: (+JUNTOS team)
// Locale: pt_PT

// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/domain/User.kt
// Descrição: Entidade Utilizador
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime

@Table("users")
data class User(
    @Id
    val id: Long? = null,
    val firebaseUid: String? = null,
    val email: String,
    val passwordHash: String? = null, // Nullable para suportar login social futuro se necessário, mas obrigatório para local
    val nome: String,
    val telefone: String? = null,
    val role: String = "USER",
    val idadesCriancas: String = "[]", // JSON array: [3,7,10]
    val cidade: String? = null,
    val distrito: String? = null,
    val premium: Boolean = false,
    val premiumExpira: LocalDateTime? = null,
    val idioma: String = "pt_PT",
    val notificacoes: Boolean = true,
    val ativo: Boolean = true,
    val criadoEm: LocalDateTime = LocalDateTime.now(),
    val ultimoLogin: LocalDateTime = LocalDateTime.now()
)
