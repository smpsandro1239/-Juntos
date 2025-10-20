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
  final AppDatabase _database;
  // Atalho para o DAO
  FavoritesDao get _favoritesDao => _database.favoritesDao;

  FavoritesRepository(this._database);

  // Verificar se um POI é favorito
  Future<bool> isFavorite(int poiId) {
    return _favoritesDao.isFavorite(poiId);
  }

  // Adicionar POI aos favoritos
  Future<void> addToFavorites(Poi poi) async {
    final favorite = FavoritesCompanion.insert(
      poiId: poi.id!,
      poiName: poi.nome,
      poiCategory: poi.categoria,
      poiAddress: poi.enderecoCompleto,
      poiLatitude: poi.latitude,
      poiLongitude: poi.longitude,
      poiPrice: poi.precoFormatado,
      poiIsFree: Value(poi.isGratis),
      idadeMin: Value(poi.idadeMin),
      idadeMax: Value(poi.idadeMax),
      precoMin: Value(poi.precoMin),
      precoMax: Value(poi.precoMax),
      acessibilidade: Value(poi.acessibilidade),
      estacionamento: Value(poi.estacionamento),
      wc: Value(poi.wc),
      cafetaria: Value(poi.cafetaria),
      interior: Value(poi.interior),
      exterior: Value(poi.exterior),
    );

    await _favoritesDao.addFavorite(favorite);
  }

  // Remover POI dos favoritos
  Future<void> removeFromFavorites(int poiId) async {
    await _favoritesDao.removeFavorite(poiId);
  }

  // Alternar favorito (add/remove)
  Future<bool> toggleFavorite(Poi poi) async {
    final isCurrentlyFavorite = await isFavorite(poi.id!);

    if (isCurrentlyFavorite) {
      await removeFromFavorites(poi.id!);
      return false;
    } else {
      await addToFavorites(poi);
      return true;
    }
  }

  // Obter todos os favoritos
  Future<List<Favorite>> getAllFavorites() {
    return _favoritesDao.getAllFavorites();
  }

  // Limpar todos os favoritos
  Future<void> clearAllFavorites() async {
    await _favoritesDao.removeAllFavorites();
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
