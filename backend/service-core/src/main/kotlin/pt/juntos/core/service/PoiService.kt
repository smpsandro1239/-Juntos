// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/service/PoiService.kt
// Descrição: Serviço de gestão de POIs com caching
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.service

import com.fasterxml.jackson.databind.ObjectMapper
import io.micrometer.core.instrument.MeterRegistry
import org.springframework.data.redis.core.ReactiveRedisTemplate
import org.springframework.stereotype.Service
import pt.juntos.core.domain.Poi
import pt.juntos.core.repository.PoiRepository
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.time.Duration

@Service
class PoiService(
    private val poiRepository: PoiRepository,
    private val redisTemplate: ReactiveRedisTemplate<String, String>,
    private val objectMapper: ObjectMapper,
    private val meterRegistry: MeterRegistry
) {

    data class PaginatedResult<T>(
        val items: List<T>,
        val page: Int,
        val size: Int,
        val total: Long,
        val totalPages: Int
    )

    fun findNearby(lat: Double, lng: Double, raio: Int, idadeMin: Int, idadeMax: Int, limite: Int): Flux<Poi> {
        return poiRepository.findNearbyByAge(lat, lng, raio, idadeMin, idadeMax, limite)
    }

    fun search(q: String, limite: Int): Flux<Poi> {
        return poiRepository.searchByTerm("%$q%", limite)
    }

    fun findById(id: Long): Mono<Poi> {
        return poiRepository.findById(id)
    }

    fun findByCategory(categoria: String): Flux<Poi> {
        return poiRepository.findByCategoriaAndAtivoTrue(categoria)
    }

    fun countActive(): Mono<Long> {
        return poiRepository.countActive()
    }

    fun findPaginated(
        page: Int,
        size: Int,
        q: String?,
        categoria: String?,
        idadeMin: Int?,
        idadeMax: Int?,
        lat: Double?,
        lng: Double?,
        raio: Int?
    ): Mono<PaginatedResult<Poi>> {
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
                meterRegistry.counter("cache.pois.hits").increment()
                val result = objectMapper.readValue(str, PaginatedResult::class.java) as PaginatedResult<Poi>
                Mono.just(result)
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
                    meterRegistry.counter("cache.pois.misses").increment()
                    val json = objectMapper.writeValueAsString(result)
                    redisTemplate.opsForValue().set(cacheKey, json, Duration.ofSeconds(60)).subscribe()
                } catch (ex: Exception) {
                    // ignore cache errors
                }
                Mono.just(result)
            }
        )
    }

    fun createPoi(poi: Poi): Mono<Poi> {
        return poiRepository.save(poi)
            .flatMap { saved ->
                invalidateCacheByPoi(saved).thenReturn(saved)
            }
    }

    fun updatePoi(id: Long, poi: Poi): Mono<Poi> {
        return poiRepository.findById(id)
            .flatMap { existing ->
                val updated = existing.copy(
                    nome = poi.nome,
                    descricao = poi.descricao,
                    categoria = poi.categoria,
                    ativo = poi.ativo,
                    idadeMin = poi.idadeMin,
                    idadeMax = poi.idadeMax,
                    precoMin = poi.precoMin,
                    precoMax = poi.precoMax,
                    latitude = poi.latitude,
                    longitude = poi.longitude,
                    morada = poi.morada,
                    codigoPostal = poi.codigoPostal,
                    cidade = poi.cidade,
                    distrito = poi.distrito,
                    telefone = poi.telefone,
                    website = poi.website,
                    email = poi.email,
                    horarioAbertura = poi.horarioAbertura,
                    horarioFecho = poi.horarioFecho,
                    acessibilidade = poi.acessibilidade,
                    estacionamento = poi.estacionamento,
                    wc = poi.wc,
                    cafetaria = poi.cafetaria,
                    interior = poi.interior,
                    exterior = poi.exterior,
                    atualizadoEm = java.time.LocalDateTime.now()
                )
                poiRepository.save(updated)
            }
            .flatMap { saved -> invalidateCacheByPoi(saved).thenReturn(saved) }
    }

    fun deletePoi(id: Long): Mono<Void> {
        return poiRepository.findById(id)
            .flatMap { existing ->
                poiRepository.delete(existing)
                    .then(invalidateCacheByPoi(existing))
                    .then()
            }
    }

    private fun invalidatePoisCache(): Mono<Boolean> {
        // Default: clear all paginated keys
        return redisTemplate.keys("pois:paginated:*")
            .flatMap { key -> redisTemplate.delete(key) }
            .then(Mono.just(true))
    }

    private fun invalidateCacheByCategory(categoria: String?): Mono<Boolean> {
        if (categoria.isNullOrBlank()) return Mono.just(false)
        val pattern = "pois:paginated:*:cat=${categoria}:*"
        return redisTemplate.keys(pattern).flatMap { k -> redisTemplate.delete(k) }.then(Mono.just(true))
    }

    private fun invalidateCacheByPoi(poi: Poi): Mono<Boolean> {
        // Simple strategy: invalidate by category and by any paginated queries with lat/lng present
        val byCat = invalidateCacheByCategory(poi.categoria)
        val byGeo = redisTemplate.keys("pois:paginated:*:lat=*").flatMap { k -> redisTemplate.delete(k) }.then(Mono.just(true))
        return Mono.zip(byCat, byGeo).map { true }
    }
}
