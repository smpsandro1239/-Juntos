// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/security/JwtUtils.kt
// Descrição: Utilitários para manipulação de tokens JWT
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.security

import io.jsonwebtoken.*
import io.jsonwebtoken.security.Keys
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.security.core.Authentication
import org.springframework.stereotype.Component
import pt.juntos.core.security.services.UserDetailsImpl
import java.util.*

@Component
class JwtUtils {

    private val logger = LoggerFactory.getLogger(JwtUtils::class.java)

    @Value("\${juntos.app.jwtSecret}")
    private lateinit var jwtSecret: String

    @Value("\${juntos.app.jwtExpirationMs}")
    private var jwtExpirationMs: Int = 0

    fun generateJwtToken(authentication: Authentication): String {
        val userPrincipal = authentication.principal as UserDetailsImpl

        return Jwts.builder()
            .setSubject(userPrincipal.username)
            .setIssuedAt(Date())
            .setExpiration(Date(Date().time + jwtExpirationMs))
            .claim("id", userPrincipal.id)
            .claim("email", userPrincipal.email)
            .claim("role", userPrincipal.authorities.firstOrNull()?.authority)
            .signWith(Keys.hmacShaKeyFor(jwtSecret.toByteArray()))
            .compact()
    }

    fun generateTokenFromUsername(username: String): String {
        return Jwts.builder()
            .setSubject(username)
            .setIssuedAt(Date())
            .setExpiration(Date(Date().time + jwtExpirationMs))
            .signWith(Keys.hmacShaKeyFor(jwtSecret.toByteArray()))
            .compact()
    }

    fun getUserNameFromJwtToken(token: String): String {
        return Jwts.parserBuilder()
            .setSigningKey(Keys.hmacShaKeyFor(jwtSecret.toByteArray()))
            .build()
            .parseClaimsJws(token)
            .body
            .subject
    }

    fun validateJwtToken(authToken: String): Boolean {
        try {
            Jwts.parserBuilder()
                .setSigningKey(Keys.hmacShaKeyFor(jwtSecret.toByteArray()))
                .build()
                .parseClaimsJws(authToken)
            return true
        } catch (e: MalformedJwtException) {
            logger.error("Invalid JWT token: {}", e.message)
        } catch (e: ExpiredJwtException) {
            logger.error("JWT token is expired: {}", e.message)
        } catch (e: UnsupportedJwtException) {
            logger.error("JWT token is unsupported: {}", e.message)
        } catch (e: IllegalArgumentException) {
            logger.error("JWT claims string is empty: {}", e.message)
        }

        return false
    }
}
