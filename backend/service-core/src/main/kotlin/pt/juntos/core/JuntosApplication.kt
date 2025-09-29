// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/JuntosApplication.kt
// Descrição: Aplicação principal Spring Boot
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.r2dbc.repository.config.EnableR2dbcRepositories

@SpringBootApplication
@EnableR2dbcRepositories
class JuntosApplication

fun main(args: Array<String>) {
    runApplication<JuntosApplication>(*args)
}