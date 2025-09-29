
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/AlbumController.kt
// Descrição: Controller para os endpoints de Albuns
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.springframework.web.bind.annotation.*
import pt.juntos.core.domain.Album
import pt.juntos.core.repository.AlbumRepository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.UUID

@RestController
@RequestMapping("/v1/albums")
class AlbumController(private val albumRepository: AlbumRepository) {

    @GetMapping
    fun getAllAlbums(): Flux<Album> = albumRepository.findAll()

    @GetMapping("/{id}")
    fun getAlbumById(@PathVariable id: UUID): Mono<Album> = albumRepository.findById(id)

    @PostMapping
    fun createAlbum(@RequestBody album: Album): Mono<Album> = albumRepository.save(album)
}
