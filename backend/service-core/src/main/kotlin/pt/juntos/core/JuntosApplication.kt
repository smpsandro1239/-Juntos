
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/JuntosApplication.kt
// Descrição: Entry point da aplicação Spring Boot
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class JuntosApplication

fun main(args: Array<String>) {
    runApplication<JuntosApplication>(*args)
}
