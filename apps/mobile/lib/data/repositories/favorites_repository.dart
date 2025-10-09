// +JUNTOS
// Ficheiro: lib/data/repositories/favorites_repository.dart
// Descrição: Repositório para gestão de favoritos locais
// Autor: (+JUNTOS team)
// Locale: pt_PT

import '../models/poi.dart';
import '../local/database/app_database.dart';

class FavoritesRepository {
  final AppDatabase _database;

  FavoritesRepository(this._database);

  // Verificar se um POI é favorito
  Future<bool> isFavorite(int poiId) {
    return _database.isFavorite(poiId);
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
      poiIsFree: poi.isGratis,
    );

    await _database.addFavorite(favorite);
  }

  // Remover POI dos favoritos
  Future<void> removeFromFavorites(int poiId) async {
    await _database.removeFavorite(poiId);
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
    return _database.getAllFavorites();
  }

  // Limpar todos os favoritos
  Future<void> clearAllFavorites() async {
    await _database.removeAllFavorites();
  }

  // Observar mudanças nos favoritos (para UI reativa)
  Stream<List<Favorite>> watchAllFavorites() {
    return _database.watchAllFavorites();
  }

  // Observar se um POI específico é favorito
  Stream<bool> watchIsFavorite(int poiId) {
    return _database.watchIsFavorite(poiId);
  }
}
