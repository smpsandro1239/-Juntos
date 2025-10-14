// +JUNTOS
// Ficheiro: src/main/kotlin/pt/juntos/core/repository/PoiRepository.kt
// Descrição: Repositório R2DBC para POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

package pt.juntos.core.repository

import org.springframework.data.r2dbc.repository.Query
import org.springframework.data.repository.reactive.ReactiveCrudRepository
import pt.juntos.core.domain.Poi
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

interface PoiRepository : ReactiveCrudRepository<Poi, Long>, PoiCustomRepository {
    
    @Query("""
        SELECT * FROM pois 
        WHERE ativo = true 
        AND idade_min <= :idadeMax 
        AND idade_max >= :idadeMin
        AND ST_DWithin(ST_Point(longitude, latitude)::geography, ST_Point(:lng, :lat)::geography, :raioMetros)
        ORDER BY ST_Distance(ST_Point(longitude, latitude)::geography, ST_Point(:lng, :lat)::geography)
        LIMIT :limite
    """)
    fun findNearbyByAge(
        lat: Double, 
        lng: Double, 
        raioMetros: Int, 
        idadeMin: Int, 
        idadeMax: Int, 
        limite: Int
    ): Flux<Poi>
    
    @Query("""
        SELECT * FROM pois 
        WHERE ativo = true 
        AND (LOWER(nome) LIKE LOWER(:termo) OR LOWER(descricao) LIKE LOWER(:termo))
        ORDER BY nome
        LIMIT :limite
    """)
    fun searchByTerm(termo: String, limite: Int): Flux<Poi>
    
    fun findByCategoriaAndAtivoTrue(categoria: String): Flux<Poi>
    
    @Query("SELECT COUNT(*) FROM pois WHERE ativo = true")
    fun countActive(): Mono<Long>

    @Query("""
        SELECT * FROM pois
        WHERE ativo = true
        ORDER BY nome
        LIMIT :limit OFFSET :offset
    """)
    fun findActivePaginated(limit: Int, offset: Int): Flux<Poi>
}