// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/payload/JwtResponse.kt
// Descrição: DTO para response de autenticação JWT
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.payload

data class JwtResponse(
    val accessToken: String,
    val tokenType: String = "Bearer",
    val id: Long,
    val email: String,
    val nome: String,
    val role: String
) {
    val type: String = tokenType
}
