// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/payload/LoginRequest.kt
// Descrição: DTO para request de login
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.payload

data class LoginRequest(
    val email: String,
    val password: String
)
