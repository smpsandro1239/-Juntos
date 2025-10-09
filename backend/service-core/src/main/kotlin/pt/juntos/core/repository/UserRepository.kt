// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/repository/UserRepository.kt
// Descrição: Repositório R2DBC para Users
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.repository

import org.springframework.data.repository.reactive.ReactiveCrudRepository
import pt.juntos.core.domain.User
import reactor.core.publisher.Mono

interface UserRepository : ReactiveCrudRepository<User, Long> {

    fun findByEmailAndAtivoTrue(email: String): Mono<User>

    fun existsByEmail(email: String): Mono<Boolean>
}
