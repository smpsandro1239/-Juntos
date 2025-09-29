
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/web/PoiController.kt
// Descrição: Controller para os endpoints de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import org.springframework.web.bind.annotation.*
import pt.juntos.core.domain.Poi
import pt.juntos.core.repository.PoiRepository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.UUID

@RestController
@RequestMapping("/v1/pois")
class PoiController(private val poiRepository: PoiRepository) {

    @GetMapping
    fun getAllPois(): Flux<Poi> = poiRepository.findAll()

    @GetMapping("/{id}")
    fun getPoiById(@PathVariable id: UUID): Mono<Poi> = poiRepository.findById(id)

    @PostMapping
    fun createPoi(@RequestBody poi: Poi): Mono<Poi> = poiRepository.save(poi)

    @GetMapping("/search/nearby")
    fun getNearbyPois(
        @RequestParam lat: Double,
        @RequestParam lon: Double,
        @RequestParam(defaultValue = "5000") radius: Int
    ): Flux<Poi> = poiRepository.findNearby(lat, lon, radius)

}
