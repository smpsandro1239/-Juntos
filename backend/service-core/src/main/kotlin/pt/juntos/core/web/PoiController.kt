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
import com.fasterxml.jackson.databind.ObjectMapper
import org.springframework.data.redis.core.ReactiveRedisTemplate
import java.time.Duration

@RestController
@RequestMapping("/v1/pois")
@Tag(name = "POIs", description = "Pontos de Interesse Familiares")
class PoiController(
    private val poiRepository: PoiRepository,
    private val redisTemplate: ReactiveRedisTemplate<String, String>,
    private val objectMapper: ObjectMapper
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

    data class PaginatedResult<T>(
        val items: List<T>,
        val page: Int,
        val size: Int,
        val total: Long,
        val totalPages: Int
    )

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
    ): Mono<ResponseEntity<PaginatedResult<Poi>>> {
        val validatedPage = if (page < 0) 0 else page
        val validatedSize = when {
            size <= 0 -> 20
            size > 100 -> 100
            else -> size
        }

        // Build cache key from params
        val cacheKey = "pois:paginated:page=$validatedPage:size=$validatedSize:q=${q ?: ""}:cat=${categoria ?: ""}:iMin=${idadeMin ?: ""}:iMax=${idadeMax ?: ""}:lat=${lat ?: ""}:lng=${lng ?: ""}:r=${raio ?: ""}"

        val cached = redisTemplate.opsForValue().get(cacheKey)

        return cached.flatMap { str ->
            try {
                val result = objectMapper.readValue(str, PaginatedResult::class.java) as PaginatedResult<Poi>
                ResponseEntity.ok(result).toMono()
            } catch (ex: Exception) {
                Mono.empty()
            }
        }.switchIfEmpty(
            // No cache: query DB
            Mono.zip(
                poiRepository.findFilteredPaginated(validatedPage, validatedSize, q, categoria, idadeMin, idadeMax, lat, lng, raio)
                    .collectList(),
                poiRepository.countFiltered(q, categoria, idadeMin, idadeMax, lat, lng, raio)
            ).flatMap { tuple ->
                val items = tuple.t1
                val total = tuple.t2 ?: 0L
                val totalPages = if (total == 0L) 0 else ((total + validatedSize - 1) / validatedSize).toInt()
                val result = PaginatedResult(items, validatedPage, validatedSize, total, totalPages)
                try {
                    val json = objectMapper.writeValueAsString(result)
                    redisTemplate.opsForValue().set(cacheKey, json, Duration.ofSeconds(60)).subscribe()
                } catch (ex: Exception) {
                    // ignore cache errors
                }
                ResponseEntity.ok(result).toMono()
            }
        )
    }

    private fun invalidatePoisCache(): Mono<Boolean> {
        // For simplicity just clear keys with prefix pois:paginated:*
        return redisTemplate.keys("pois:paginated:*")
            .flatMap { key -> redisTemplate.delete(key) }
            .then(Mono.just(true))
    }

    @PostMapping
    fun createPoi(@RequestBody poi: Poi): Mono<ResponseEntity<Poi>> {
        return poiRepository.save(poi)
            .flatMap { saved ->
                invalidatePoisCache().thenReturn(ResponseEntity.ok(saved))
            }
    }

    @PutMapping("/{id}")
    fun updatePoi(@PathVariable id: Long, @RequestBody poi: Poi): Mono<ResponseEntity<Poi>> {
        return poiRepository.findById(id)
            .flatMap { existing ->
                val updated = existing.copy(
                    nome = poi.nome,
                    descricao = poi.descricao,
                    categoria = poi.categoria,
                    ativo = poi.ativo
                    // ... copy other fields as needed
                )
                poiRepository.save(updated)
            }
            .flatMap { saved -> invalidatePoisCache().thenReturn(ResponseEntity.ok(saved)) }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }

    @DeleteMapping("/{id}")
    fun deletePoi(@PathVariable id: Long): Mono<ResponseEntity<Void>> {
        return poiRepository.findById(id)
            .flatMap { existing ->
                poiRepository.delete(existing).then(invalidatePoisCache()).thenReturn(ResponseEntity.noContent().build<Void>())
            }
            .defaultIfEmpty(ResponseEntity.notFound().build())
    }
}