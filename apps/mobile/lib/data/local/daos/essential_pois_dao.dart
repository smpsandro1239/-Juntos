// +JUNTOS
// Ficheiro: lib/data/local/daos/essential_pois_dao.dart
// Descrição: Data Access Object para os POIs do bundle essencial
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:mobile/data/local/database/app_database.dart';
import 'package:mobile/data/local/models/essential_poi.dart';
import 'package:mobile/data/models/poi.dart';

part 'essential_pois_dao.g.dart';

@DriftAccessor(tables: [EssentialPois])
class EssentialPoisDao extends DatabaseAccessor<AppDatabase> with _$EssentialPoisDaoMixin {
  EssentialPoisDao(AppDatabase db) : super(db);

  // Obter todos os POIs do bundle
  Future<List<Poi>> getAllEssentialPois() async {
    final results = await select(essentialPois).get();
    return results.map(_mapEntryToPoi).toList();
  }

  // Guardar uma lista de POIs do bundle, substituindo os antigos
  Future<void> storeBundle(List<Poi> pois) async {
    await transaction(() async {
      await delete(essentialPois).go();
      final entries = pois.map(_mapPoiToCompanion).toList();
      await batch((batch) {
        batch.insertAll(essentialPois, entries);
      });
    });
  }

  // Contar quantos POIs existem no bundle
  Future<int> countPois() async {
    final count = essentialPois.id.count();
    final query = selectOnly(essentialPois)..addColumns([count]);
    return (await query.getSingle())?.read(count) ?? 0;
  }

  EssentialPoisCompanion _mapPoiToCompanion(Poi poi) {
    return EssentialPoisCompanion.insert(
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
    );
  }

  Poi _mapEntryToPoi(EssentialPoiEntry entry) {
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
      fotos: [],
      isFavorito: false,
      distancia: null,
    );
  }
}
