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

  // Alternar favorito (add/remove)
  Future<bool> toggleFavorite(Poi poi) async {
    final isCurrentlyFavorite = await watchIsFavorite(poi.id!).first;

    if (isCurrentlyFavorite) {
      await _favoritesDao.removeFavorite(poi.id!);
      return false;
    } else {
      final favorite = FavoritesCompanion(
        poiId: Value(poi.id!),
        poiName: Value(poi.nome),
        poiCategory: Value(poi.categoria),
        poiAddress: Value(poi.enderecoCompleto),
        poiLatitude: Value(poi.latitude),
        poiLongitude: Value(poi.longitude),
        poiPrice: Value(poi.precoFormatado),
        poiIsFree: Value(poi.isGratis),
      );
      await _favoritesDao.addFavorite(favorite);
      return true;
    }
  }

  // Obter todos os favoritos
  Future<List<Favorite>> getAllFavorites() {
    return _favoritesDao.getAllFavorites();
  }

  // Observar mudanças nos favoritos (para UI reativa)
  Stream<List<Favorite>> watchAllFavorites() {
    return _favoritesDao.watchAllFavorites();
  }

  // Observar se um POI específico é favorito
  Stream<bool> watchIsFavorite(int poiId) {
    return _favoritesDao.watchIsFavorite(poiId);
  }
}
