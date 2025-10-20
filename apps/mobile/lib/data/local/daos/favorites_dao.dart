// +JUNTOS
// Ficheiro: lib/data/local/daos/favorites_dao.dart
// Descrição: Data Access Object para a tabela de favoritos
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/favorite.dart';

part 'favorites_dao.g.dart';

@DriftAccessor(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase> with _$FavoritesDaoMixin {
  FavoritesDao(AppDatabase db) : super(db);

  Future<List<Favorite>> getAllFavorites() => select(favorites).get();

  Future<Favorite?> getFavoriteByPoiId(int poiId) {
    return (select(favorites)..where((f) => f.poiId.equals(poiId))).getSingleOrNull();
  }

  Future<bool> isFavorite(int poiId) async {
    final favorite = await getFavoriteByPoiId(poiId);
    return favorite != null;
  }

  Future<int> addFavorite(FavoritesCompanion favorite) {
    return into(favorites).insert(favorite);
  }

  Future<bool> removeFavorite(int poiId) {
    return (delete(favorites)..where((f) => f.poiId.equals(poiId))).go().then((rows) => rows > 0);
  }

  Future<int> removeAllFavorites() {
    return delete(favorites).go();
  }

  Stream<List<Favorite>> watchAllFavorites() {
    return select(favorites).watch();
  }

  Stream<bool> watchIsFavorite(int poiId) {
    final query = select(favorites)..where((f) => f.poiId.equals(poiId));
    return query.watch().map((favorites) => favorites.isNotEmpty);
  }
}
