// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/security/services/UserDetailsImpl.kt
// Descrição: Implementação de UserDetails para Spring Security
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.security.services

import com.fasterxml.jackson.annotation.JsonIgnore
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import pt.juntos.core.domain.User

class UserDetailsImpl(
    val id: Long,
    val email: String,
    @field:JsonIgnore
    private val password: String,
    private val authorities: Collection<GrantedAuthority>
) : UserDetails {

    companion object {
        fun build(user: User): UserDetailsImpl {
            val authorities = listOf(SimpleGrantedAuthority(user.role))

            return UserDetailsImpl(
                id = user.id!!,
                email = user.email,
                password = user.passwordHash ?: "",
                authorities = authorities
            )
        }
    }

    override fun getAuthorities(): Collection<GrantedAuthority> = authorities

    override fun getPassword(): String = password

    override fun getUsername(): String = email

    override fun isAccountNonExpired(): Boolean = true

    override fun isAccountNonLocked(): Boolean = true

    override fun isCredentialsNonExpired(): Boolean = true

    override fun isEnabled(): Boolean = true
}
