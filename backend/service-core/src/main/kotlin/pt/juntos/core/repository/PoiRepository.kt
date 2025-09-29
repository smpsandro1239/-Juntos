
// +JUNTOS
// Ficheiro: backend/service-core/src/main/kotlin/pt/juntos/core/repository/PoiRepository.kt
// Descrição: Repositório para acesso a dados de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.repository

import org.springframework.data.r2dbc.repository.Query
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import pt.juntos.core.domain.Poi
import reactor.core.publisher.Flux
import java.util.UUID

interface PoiRepository : ReactiveCrudRepository<Poi, UUID> {

    @Query("""
        SELECT * FROM pois
        WHERE ST_DWithin(
            ST_MakePoint(longitude, latitude)::geography,
            ST_MakePoint(:lon, :lat)::geography,
            :radius
        )
    """)
    fun findNearby(lat: Double, lon: Double, radius: Int): Flux<Poi>
}
