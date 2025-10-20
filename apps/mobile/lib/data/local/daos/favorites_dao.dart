// +JUNTOS
// Ficheiro: lib/data/local/daos/favorites_dao.dart
// Descrição: DAO para interagir com a tabela de favoritos
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
  Stream<List<Favorite>> watchAllFavorites() => select(favorites).watch();
  Future<void> addFavorite(FavoritesCompanion entry) => into(favorites).insert(entry);
  Future<int> removeFavorite(int poiId) => (delete(favorites)..where((f) => f.poiId.equals(poiId))).go();
  Stream<bool> watchIsFavorite(int poiId) {
    return (select(favorites)..where((f) => f.poiId.equals(poiId)))
        .watch()
        .map((favorites) => favorites.isNotEmpty);
  }
}
