// +JUNTOS
// Ficheiro: lib/data/repositories/favorites_repository.dart
// Descrição: Repositório para gestão de favoritos locais
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';
import '../models/poi.dart';
import '../local/database/app_database.dart';
import '../local/daos/favorites_dao.dart';

class FavoritesRepository {
  final FavoritesDao _favoritesDao;

  FavoritesRepository(this._favoritesDao);

  Future<bool> toggleFavorite(Poi poi) async {
    final isCurrentlyFavorite = await watchIsFavorite(poi.id!).first;

    if (isCurrentlyFavorite) {
      await _favoritesDao.removeFavorite(poi.id!);
      return false;
    } else {
      final favorite = FavoritesCompanion(
        poiId: Value(poi.id!),
        nome: Value(poi.nome),
        descricao: Value(poi.descricao),
        categoria: Value(poi.categoria),
        idadeMin: Value(poi.idadeMin),
        idadeMax: Value(poi.idadeMax),
        precoMin: Value(poi.precoMin),
        precoMax: Value(poi.precoMax),
        latitude: Value(poi.latitude),
        longitude: Value(poi.longitude),
        morada: Value(poi.morada),
        codigoPostal: Value(poi.codigoPostal),
        cidade: Value(poi.cidade),
        distrito: Value(poi.distrito),
        telefone: Value(poi.telefone),
        website: Value(poi.website),
        email: Value(poi.email),
        horarioAbertura: Value(poi.horarioAbertura),
        horarioFecho: Value(poi.horarioFecho),
        acessibilidade: Value(poi.acessibilidade),
        estacionamento: Value(poi.estacionamento),
        wc: Value(poi.wc),
        cafetaria: Value(poi.cafetaria),
        interior: Value(poi.interior),
        exterior: Value(poi.exterior),
        ativo: Value(poi.ativo),
      );
      await _favoritesDao.addFavorite(favorite);
      return true;
    }
  }

  Future<List<Favorite>> getAllFavorites() {
    return _favoritesDao.getAllFavorites();
  }

  Stream<List<Favorite>> watchAllFavorites() {
    return _favoritesDao.watchAllFavorites();
  }

  Stream<bool> watchIsFavorite(int poiId) {
    return _favoritesDao.watchIsFavorite(poiId);
  }
}
