// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/web/AuthController.kt
// Descrição: Controller REST para autenticação
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import jakarta.validation.Valid
import org.springframework.http.ResponseEntity
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.bind.annotation.*
import pt.juntos.core.domain.User
import pt.juntos.core.payload.JwtResponse
import pt.juntos.core.payload.LoginRequest
import pt.juntos.core.payload.MessageResponse
import pt.juntos.core.payload.SignupRequest
import pt.juntos.core.repository.UserRepository
import pt.juntos.core.security.JwtUtils
import pt.juntos.core.security.services.UserDetailsImpl
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/v1/auth")
@Tag(name = "Authentication", description = "Endpoints de autenticação")
class AuthController(
    private val authenticationManager: AuthenticationManager,
    private val userRepository: UserRepository,
    private val encoder: PasswordEncoder,
    private val jwtUtils: JwtUtils
) {

    @PostMapping("/login")
    @Operation(summary = "Login de utilizador", description = "Autentica utilizador e retorna token JWT")
    fun authenticateUser(@Valid @RequestBody loginRequest: LoginRequest): Mono<ResponseEntity<JwtResponse>> {
        val authentication: Authentication = authenticationManager.authenticate(
            UsernamePasswordAuthenticationToken(loginRequest.email, loginRequest.password)
        )

        SecurityContextHolder.getContext().authentication = authentication
        val jwt = jwtUtils.generateJwtToken(authentication)

        val userDetails = authentication.principal as UserDetailsImpl
        val role = userDetails.authorities.firstOrNull()?.authority ?: "USER"

        val jwtResponse = JwtResponse(
            accessToken = jwt,
            id = userDetails.id,
            email = userDetails.email,
            nome = userDetails.username,
            role = role
        )

        return Mono.just(ResponseEntity.ok(jwtResponse))
    }

    @PostMapping("/register")
    @Operation(summary = "Registo de utilizador", description = "Regista novo utilizador na plataforma")
    fun registerUser(@Valid @RequestBody signUpRequest: SignupRequest): Mono<ResponseEntity<MessageResponse>> {
        return userRepository.existsByEmail(signUpRequest.email)
            .flatMap { exists ->
                if (exists) {
                    Mono.just(ResponseEntity.badRequest()
                        .body(MessageResponse("Erro: Email já está em uso!")))
                } else {
                    val user = User(
                        nome = signUpRequest.nome,
                        email = signUpRequest.email,
                        passwordHash = encoder.encode(signUpRequest.password),
                        telefone = signUpRequest.telefone,
                        role = "USER"
                    )

                    userRepository.save(user)
                        .map {
                            ResponseEntity.ok(MessageResponse("Utilizador registado com sucesso!"))
                        }
                }
            }
    }

    @PostMapping("/validate")
    @Operation(summary = "Validar token", description = "Verifica se o token JWT é válido")
    fun validateToken(@RequestHeader("Authorization") token: String): Mono<ResponseEntity<MessageResponse>> {
        val jwt = if (token.startsWith("Bearer ")) token.substring(7) else token

        return if (jwtUtils.validateJwtToken(jwt)) {
            Mono.just(ResponseEntity.ok(MessageResponse("Token válido")))
        } else {
            Mono.just(ResponseEntity.badRequest().body(MessageResponse("Token inválido")))
        }
    }
}
