package pt.juntos.core.repository

import org.springframework.r2dbc.core.DatabaseClient
import org.springframework.stereotype.Repository
import pt.juntos.core.domain.Poi
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

@Repository
class PoiCustomRepositoryImpl(private val db: DatabaseClient) : PoiCustomRepository {

    override fun findFilteredPaginated(
        page: Int,
        size: Int,
        termo: String?,
        categoria: String?,
        idadeMin: Int?,
        idadeMax: Int?,
        lat: Double?,
        lng: Double?,
        raioMetros: Int?
    ): Flux<Poi> {
        val offset = page * size
        val sql = StringBuilder()
        val where = StringBuilder("WHERE ativo = true")

        val bindings = mutableMapOf<String, Any?>()

        if (!termo.isNullOrBlank()) {
            where.append(" AND (LOWER(nome) LIKE LOWER(:termo) OR LOWER(descricao) LIKE LOWER(:termo))")
            bindings["termo"] = "%${termo}%"
        }
        if (!categoria.isNullOrBlank()) {
            where.append(" AND categoria = :categoria")
            bindings["categoria"] = categoria
        }
        if (idadeMin != null) {
            where.append(" AND idade_max >= :idadeMin")
            bindings["idadeMin"] = idadeMin
        }
        if (idadeMax != null) {
            where.append(" AND idade_min <= :idadeMax")
            bindings["idadeMax"] = idadeMax
        }
        if (lat != null && lng != null && raioMetros != null) {
            where.append(" AND ST_DWithin(ST_Point(longitude, latitude)::geography, ST_Point(:lng, :lat)::geography, :raio)")
            bindings["lat"] = lat
            bindings["lng"] = lng
            bindings["raio"] = raioMetros
        }

        sql.append("SELECT * FROM pois ").append(where)

        // If distance ordering required, prefer name ordering otherwise
        if (lat != null && lng != null) {
            sql.append(" ORDER BY ST_Distance(ST_Point(longitude, latitude)::geography, ST_Point(:lng, :lat)::geography)")
        } else {
            sql.append(" ORDER BY nome")
        }

        sql.append(" LIMIT :size OFFSET :offset")
        bindings["size"] = size
        bindings["offset"] = offset

        var spec = db.sql(sql.toString())
        for ((k, v) in bindings) {
            spec = spec.bind(k, v)
        }

        return spec.map { row, _ ->
            Poi(
                id = row.get("id") as Long,
                nome = row.get("nome") as String,
                descricao = row.get("descricao") as String,
                categoria = row.get("categoria") as String,
                idadeMin = row.get("idade_min") as Int,
                idadeMax = row.get("idade_max") as Int,
                precoMin = row.get("preco_min") as Int,
                precoMax = row.get("preco_max") as Int,
                latitude = (row.get("latitude") as Number).toDouble(),
                longitude = (row.get("longitude") as Number).toDouble(),
                morada = row.get("morada") as String,
                codigoPostal = row.get("codigo_postal") as String,
                cidade = row.get("cidade") as String,
                distrito = row.get("distrito") as String,
                telefone = row.get("telefone") as String?,
                website = row.get("website") as String?,
                email = row.get("email") as String?,
                acessibilidade = row.get("acessibilidade") as Boolean,
                estacionamento = row.get("estacionamento") as Boolean,
                wc = row.get("wc") as Boolean,
                interior = row.get("interior") as Boolean,
                exterior = row.get("exterior") as Boolean,
                ativo = row.get("ativo") as Boolean,
                criadoEm = row.get("criado_em")?.toString() ?: ""
            )
        }.all()
    }

    override fun countFiltered(
        termo: String?,
        categoria: String?,
        idadeMin: Int?,
        idadeMax: Int?,
        lat: Double?,
        lng: Double?,
        raioMetros: Int?
    ): Mono<Long> {
        val sql = StringBuilder()
        val where = StringBuilder("WHERE ativo = true")
        val bindings = mutableMapOf<String, Any?>()

        if (!termo.isNullOrBlank()) {
            where.append(" AND (LOWER(nome) LIKE LOWER(:termo) OR LOWER(descricao) LIKE LOWER(:termo))")
            bindings["termo"] = "%${termo}%"
        }
        if (!categoria.isNullOrBlank()) {
            where.append(" AND categoria = :categoria")
            bindings["categoria"] = categoria
        }
        if (idadeMin != null) {
            where.append(" AND idade_max >= :idadeMin")
            bindings["idadeMin"] = idadeMin
        }
        if (idadeMax != null) {
            where.append(" AND idade_min <= :idadeMax")
            bindings["idadeMax"] = idadeMax
        }
        if (lat != null && lng != null && raioMetros != null) {
            where.append(" AND ST_DWithin(ST_Point(longitude, latitude)::geography, ST_Point(:lng, :lat)::geography, :raio)")
            bindings["lat"] = lat
            bindings["lng"] = lng
            bindings["raio"] = raioMetros
        }

        sql.append("SELECT COUNT(*) as c FROM pois ").append(where)

        var spec = db.sql(sql.toString())
        for ((k, v) in bindings) {
            spec = spec.bind(k, v)
        }

        return spec.map { row, _ -> (row.get("c") as Number).toLong() }.one()
    }
}
