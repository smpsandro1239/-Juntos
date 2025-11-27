// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/service/UserService.kt
// Descrição: Serviço de gestão de utilizadores
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.service

import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import pt.juntos.core.domain.User
import pt.juntos.core.payload.SignupRequest
import pt.juntos.core.repository.UserRepository
import reactor.core.publisher.Mono

@Service
class UserService(
    private val userRepository: UserRepository,
    private val encoder: PasswordEncoder
) {

    fun existsByEmail(email: String): Mono<Boolean> {
        return userRepository.existsByEmail(email)
    }

    fun registerUser(signUpRequest: SignupRequest): Mono<User> {
        val user = User(
            nome = signUpRequest.nome,
            email = signUpRequest.email,
            passwordHash = encoder.encode(signUpRequest.password),
            telefone = signUpRequest.telefone,
            role = "USER"
        )
        return userRepository.save(user)
    }

    fun findByEmail(email: String): Mono<User> {
        return userRepository.findByEmail(email)
    }
}
