// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/security/services/UserDetailsServiceImpl.kt
// Descrição: Implementação de UserDetailsService para Spring Security
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.security.services

import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import pt.juntos.core.repository.UserRepository

@Service
class UserDetailsServiceImpl(
    private val userRepository: UserRepository
) : UserDetailsService {

    @Transactional
    override fun loadUserByUsername(email: String): UserDetails {
        val user = userRepository.findByEmailAndAtivoTrue(email)
            ?: throw UsernameNotFoundException("User Not Found with email: $email")

        return UserDetailsImpl.build(user)
    }
}
