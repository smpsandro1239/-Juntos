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
import pt.juntos.core.service.PoiService
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@RestController
@RequestMapping("/v1/pois")
@Tag(name = "POIs", description = "Pontos de Interesse Familiares")
class PoiController(
    private val poiService: PoiService
) {

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
        return poiService.findNearby(lat, lng, raio, idadeMin, idadeMax, limite)
    }

    @GetMapping("/search")
    @Operation(summary = "Pesquisar POIs", description = "Pesquisa POIs por nome ou descrição")
    fun search(
        @Parameter(description = "Termo de pesquisa") @RequestParam q: String,
        @Parameter(description = "Limite de resultados") @RequestParam(defaultValue = "20") limite: Int
    ): Flux<Poi> {
        return poiService.search(q, limite)
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obter POI por ID", description = "Retorna detalhes completos de um POI")
    fun findById(@Parameter(description = "ID do POI") @PathVariable id: Long): Mono<ResponseEntity<Poi>> {
        return poiService.findById(id)
            .map { ResponseEntity.ok(it) }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }

    @GetMapping("/categoria/{categoria}")
    @Operation(summary = "POIs por categoria", description = "Lista POIs de uma categoria específica")
    fun findByCategory(@Parameter(description = "Categoria") @PathVariable categoria: String): Flux<Poi> {
        return poiService.findByCategory(categoria)
    }

    @GetMapping("/stats")
    @Operation(summary = "Estatísticas", description = "Estatísticas gerais dos POIs")
    fun getStats(): Mono<Map<String, Any>> {
        return poiService.countActive()
            .map { count -> mapOf("totalPois" to count, "status" to "ativo") }
    }

    @GetMapping("/paginated")
    @Operation(summary = "Listar POIs paginados", description = "Retorna POIs paginados (ativos)")
    fun findPaginated(
        @Parameter(description = "Página (0-based)") @RequestParam(defaultValue = "0") page: Int,
        @Parameter(description = "Tamanho da página") @RequestParam(defaultValue = "20") size: Int,
        @Parameter(description = "Termo de pesquisa") @RequestParam(required = false) q: String?,
        @Parameter(description = "Categoria") @RequestParam(required = false) categoria: String?,
        @Parameter(description = "Idade mínima") @RequestParam(required = false) idadeMin: Int?,
        @Parameter(description = "Idade máxima") @RequestParam(required = false) idadeMax: Int?,
        @Parameter(description = "Latitude para filtro por distância") @RequestParam(required = false) lat: Double?,
        @Parameter(description = "Longitude para filtro por distância") @RequestParam(required = false) lng: Double?,
        @Parameter(description = "Raio em metros para filtro por distância") @RequestParam(required = false) raio: Int?
    ): Mono<ResponseEntity<PoiService.PaginatedResult<Poi>>> {
        return poiService.findPaginated(page, size, q, categoria, idadeMin, idadeMax, lat, lng, raio)
            .map { ResponseEntity.ok(it) }
    }

    @PostMapping
    fun createPoi(@RequestBody poi: Poi): Mono<ResponseEntity<Poi>> {
        return poiService.createPoi(poi)
            .map { ResponseEntity.ok(it) }
    }

    @PutMapping("/{id}")
    fun updatePoi(@PathVariable id: Long, @RequestBody poi: Poi): Mono<ResponseEntity<Poi>> {
        return poiService.updatePoi(id, poi)
            .map { ResponseEntity.ok(it) }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }

    @DeleteMapping("/{id}")
    fun deletePoi(@PathVariable id: Long): Mono<ResponseEntity<Void>> {
        return poiService.deletePoi(id)
            .then(Mono.just(ResponseEntity.noContent().build<Void>()))
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }
}
