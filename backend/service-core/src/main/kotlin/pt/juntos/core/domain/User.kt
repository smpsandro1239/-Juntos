
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/domain/User.kt
// Descrição: Modelo de dados para um Utilizador
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.domain

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table
import java.time.OffsetDateTime
import java.util.UUID

@Table("users")
data class User(
    @Id
    val id: UUID = UUID.randomUUID(),
    val firebaseId: String, // ID from Firebase Auth
    val email: String,
    val name: String? = null,
    val premium: Boolean = false,
    val createdAt: OffsetDateTime = OffsetDateTime.now(),
    val updatedAt: OffsetDateTime = OffsetDateTime.now()
)
