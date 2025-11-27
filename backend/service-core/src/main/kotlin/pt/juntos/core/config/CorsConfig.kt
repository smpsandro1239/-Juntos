package pt.juntos.core.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.cors.CorsConfiguration
import org.springframework.web.cors.UrlBasedCorsConfigurationSource
import org.springframework.web.filter.CorsFilter

@Configuration
class CorsConfig {

    @Bean
    fun corsFilter(): CorsFilter {
        val source = UrlBasedCorsConfigurationSource()
        val config = CorsConfiguration()

        // Permitir origens do frontend (Admin e futuramente Mobile/Web)
        config.allowedOrigins = listOf("http://localhost:5173", "http://localhost:5174", "http://localhost:3000")

        // Permitir métodos HTTP comuns
        config.allowedMethods = listOf("GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH")

        // Permitir headers necessários
        config.allowedHeaders = listOf("Authorization", "Content-Type", "X-Requested-With", "Accept", "Origin")

        // Permitir envio de credenciais (cookies, auth headers)
        config.allowCredentials = true

        // Expor headers se necessário
        config.exposedHeaders = listOf("Authorization")

        source.registerCorsConfiguration("/**", config)
        return CorsFilter(source)
    }
}
