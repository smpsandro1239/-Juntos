// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/web/PoiController.kt
// Descrição: Controller REST para POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.web

import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.Parameter
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import pt.juntos.core.domain.Poi
import pt.juntos.core.repository.PoiRepository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/v1/pois")
@Tag(name = "POIs", description = "Pontos de Interesse Familiares")
class PoiController(private val poiRepository: PoiRepository) {

    @GetMapping
    @Operation(summary = "Listar POIs próximos", description = "Encontra POIs próximos filtrados por idade das crianças")
    fun findNearby(
        @Parameter(description = "Latitude") @RequestParam lat: Double,
        @Parameter(description = "Longitude") @RequestParam lng: Double,
        @Parameter(description = "Raio em metros") @RequestParam(defaultValue = "5000") raio: Int,
        @Parameter(description = "Idade mínima das crianças") @RequestParam(defaultValue = "0") idadeMin: Int,
        @Parameter(description = "Idade máxima das crianças") @RequestParam(defaultValue = "12") idadeMax: Int,
        @Parameter(description = "Limite de resultados") @RequestParam(defaultValue = "20") limite: Int
    ): Flux<Poi> {
        return poiRepository.findNearbyByAge(lat, lng, raio, idadeMin, idadeMax, limite)
    }

    @GetMapping("/search")
    @Operation(summary = "Pesquisar POIs", description = "Pesquisa POIs por nome ou descrição")
    fun search(
        @Parameter(description = "Termo de pesquisa") @RequestParam q: String,
        @Parameter(description = "Limite de resultados") @RequestParam(defaultValue = "20") limite: Int
    ): Flux<Poi> {
        return poiRepository.searchByTerm("%$q%", limite)
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obter POI por ID", description = "Retorna detalhes completos de um POI")
    fun findById(@Parameter(description = "ID do POI") @PathVariable id: Long): Mono<ResponseEntity<Poi>> {
        return poiRepository.findById(id)
            .map { ResponseEntity.ok(it) }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }

    @GetMapping("/categoria/{categoria}")
    @Operation(summary = "POIs por categoria", description = "Lista POIs de uma categoria específica")
    fun findByCategory(@Parameter(description = "Categoria") @PathVariable categoria: String): Flux<Poi> {
        return poiRepository.findByCategoriaAndAtivoTrue(categoria)
    }

    @GetMapping("/stats")
    @Operation(summary = "Estatísticas", description = "Estatísticas gerais dos POIs")
    fun getStats(): Mono<Map<String, Any>> {
        return poiRepository.countActive()
            .map { count -> mapOf("totalPois" to count, "status" to "ativo") }
    }
}