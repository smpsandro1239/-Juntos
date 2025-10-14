package pt.juntos.core.repository

import pt.juntos.core.domain.Poi
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

interface PoiCustomRepository {
    fun findFilteredPaginated(
        page: Int,
        size: Int,
        termo: String?,
        categoria: String?,
        idadeMin: Int?,
        idadeMax: Int?,
        lat: Double?,
        lng: Double?,
        raioMetros: Int?
    ): Flux<Poi>

    fun countFiltered(
        termo: String?,
        categoria: String?,
        idadeMin: Int?,
        idadeMax: Int?,
        lat: Double?,
        lng: Double?,
        raioMetros: Int?
    ): Mono<Long>
}
