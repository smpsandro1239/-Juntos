
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/repository/AlbumRepository.kt
// Descrição: Repositório para acesso a dados de Albuns
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.repository

import org.springframework.data.repository.reactive.ReactiveCrudRepository
import pt.juntos.core.domain.Album
import java.util.UUID

interface AlbumRepository : ReactiveCrudRepository<Album, UUID>
