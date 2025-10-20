// +JUNTOS
// Ficheiro: lib/data/local/daos/cached_pois_dao.dart
// Descrição: Data Access Object para a tabela de POIs em cache
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:mobile/data/models/poi.dart';
import '../database/app_database.dart';
import '../models/cached_poi.dart';

part 'cached_pois_dao.g.dart';

@DriftAccessor(tables: [CachedPois])
class CachedPoisDao extends DatabaseAccessor<AppDatabase> with _$CachedPoisDaoMixin {
  CachedPoisDao(AppDatabase db) : super(db);

  /// Limpa todos os POIs da cache e insere uma nova lista
  Future<void> replaceCachedPois(List<Poi> pois) {
    final entries = pois.map((poi) {
      return CachedPoisCompanion.insert(
        poiId: poi.id!,
        nome: poi.nome,
        descricao: Value(poi.descricao),
        categoria: poi.categoria,
        idadeMin: poi.idadeMin,
        idadeMax: poi.idadeMax,
        precoMin: poi.precoMin,
        precoMax: poi.precoMax,
        latitude: poi.latitude,
        longitude: poi.longitude,
        morada: Value(poi.morada),
        codigoPostal: Value(poi.codigoPostal),
        cidade: Value(poi.cidade),
        distrito: Value(poi.distrito),
        telefone: Value(poi.telefone),
        website: Value(poi.website),
        email: Value(poi.email),
        horarioAbertura: Value(poi.horarioAbertura),
        horarioFecho: Value(poi.horarioFecho),
        acessibilidade: poi.acessibilidade,
        estacionamento: poi.estacionamento,
        wc: poi.wc,
        cafetaria: poi.cafetaria,
        interior: poi.interior,
        exterior: poi.exterior,
        fotos: Value(poi.fotos),
      );
    }).toList();

    return transaction(() async {
      await delete(cachedPois).go();
      await batch((batch) {
        batch.insertAll(cachedPois, entries);
      });
    });
  }

  /// Retorna todos os POIs em cache
  Future<List<CachedPoi>> getAllCachedPois() {
    return select(cachedPois).get();
  }
}
