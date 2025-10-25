// +JUNTOS
// Ficheiro: lib/data/local/daos/cached_pois_dao.dart
// Descrição: Data Access Object para os POIs em cache
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:mobile/data/local/database/app_database.dart';
import 'package:mobile/data/local/models/cached_poi.dart';
import 'package:mobile/data/models/poi.dart';

part 'cached_pois_dao.g.dart';

@DriftAccessor(tables: [CachedPois])
class CachedPoisDao extends DatabaseAccessor<AppDatabase> with _$CachedPoisDaoMixin {
  CachedPoisDao(AppDatabase db) : super(db);

  // Obter todos os POIs da cache
  Future<List<Poi>> getAllCachedPois() async {
    final results = await select(cachedPois).get();
    return results.map(_mapEntryToPoi).toList();
  }

  // Guardar uma lista de POIs na cache, substituindo os antigos
  Future<void> cachePois(List<Poi> pois) async {
    await transaction(() async {
      // Apagar todos os registos antigos
      await delete(cachedPois).go();
      // Inserir os novos
      final entries = pois.map(_mapPoiToCompanion).toList();
      await batch((batch) {
        batch.insertAll(cachedPois, entries);
      });
    });
  }

  // Mapear de Poi (modelo da API) para CachedPoisCompanion (para inserção no Drift)
  CachedPoisCompanion _mapPoiToCompanion(Poi poi) {
    return CachedPoisCompanion.insert(
      id: Value(poi.id),
      nome: poi.nome,
      descricao: Value(poi.descricao),
      categoria: poi.categoria,
      subcategoria: Value(poi.subcategoria),
      latitude: Value(poi.latitude),
      longitude: Value(poi.longitude),
      morada: Value(poi.morada),
      cidade: Value(poi.cidade),
      codPostal: Value(poi.codPostal),
      pais: Value(poi.pais),
      telefone: Value(poi.telefone),
      email: Value(poi.email),
      website: Value(poi.website),
      idadeMin: Value(poi.idadeMin),
      idadeMax: Value(poi.idadeMax),
      preco: Value(poi.preco),
      isGratuito: Value(poi.isGratuito),
      isAcessivel: Value(poi.isAcessivel),
      duracao: Value(poi.duracao),
      horario: Value(poi.horario),
      tags: Value(poi.tags?.join(',')),
      updatedAt: Value(poi.updatedAt),
      cachedAt: DateTime.now(),
    );
  }

  // Mapear de CachedPoiEntry (do Drift) para Poi (modelo da API)
  Poi _mapEntryToPoi(CachedPoiEntry entry) {
    return Poi(
      id: entry.id,
      nome: entry.nome,
      descricao: entry.descricao,
      categoria: entry.categoria,
      subcategoria: entry.subcategoria,
      latitude: entry.latitude,
      longitude: entry.longitude,
      morada: entry.morada,
      cidade: entry.cidade,
      codPostal: entry.codPostal,
      pais: entry.pais,
      telefone: entry.telefone,
      email: entry.email,
      website: entry.website,
      idadeMin: entry.idadeMin,
      idadeMax: entry.idadeMax,
      preco: entry.preco,
      isGratuito: entry.isGratuito,
      isAcessivel: entry.isAcessivel,
      duracao: entry.duracao,
      horario: entry.horario,
      tags: entry.tags?.split(','),
      updatedAt: entry.updatedAt,
      // Estes campos não existem na cache, podem ser preenchidos com valores padrão
      fotos: [],
      isFavorito: false,
      distancia: null,
    );
  }
}
