// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/payload/SignupRequest.kt
// Descrição: DTO para request de registo
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.payload

import jakarta.validation.constraints.Email
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.Size

data class SignupRequest(
    @field:NotBlank
    @field:Size(min = 3, max = 50)
    val nome: String,

    @field:NotBlank
    @field:Size(max = 50)
    @field:Email
    val email: String,

    @field:NotBlank
    @field:Size(min = 6, max = 40)
    val password: String,

    val telefone: String? = null
)
