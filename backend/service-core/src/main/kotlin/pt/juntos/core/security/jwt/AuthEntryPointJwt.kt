// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/security/jwt/AuthEntryPointJwt.kt
// Descrição: Handler para erros de autenticação não autorizada
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.security.jwt

import com.fasterxml.jackson.databind.ObjectMapper
import jakarta.servlet.ServletException
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.slf4j.LoggerFactory
import org.springframework.http.MediaType
import org.springframework.security.core.AuthenticationException
import org.springframework.security.web.AuthenticationEntryPoint
import org.springframework.stereotype.Component
import java.io.IOException

@Component
class AuthEntryPointJwt : AuthenticationEntryPoint {

    private val logger = LoggerFactory.getLogger(AuthEntryPointJwt::class.java)

    @Throws(IOException::class, ServletException::class)
    override fun commence(
        request: HttpServletRequest,
        response: HttpServletResponse,
        authException: AuthenticationException
    ) {
        logger.error("Unauthorized error: {}", authException.message)

        response.contentType = MediaType.APPLICATION_JSON_VALUE
        response.status = HttpServletResponse.SC_UNAUTHORIZED

        val body: MutableMap<String, Any> = HashMap()
        body["status"] = HttpServletResponse.SC_UNAUTHORIZED
        body["error"] = "Unauthorized"
        body["message"] = authException.message ?: "Authentication failed"
        body["path"] = request.servletPath

        val mapper = ObjectMapper()
        mapper.writeValue(response.outputStream, body)
    }
}
