// +JUNTOS
// Ficheiro: lib/data/local/database/app_database.dart
// Descrição: Configuração do banco de dados Drift SQLite
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/favorite.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Favorites])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Estratégia de migração futura
      // await m.createAll(); // Para desenvolvimento
    },
  );

  // Queries para favoritos
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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/juntos.db');
    return NativeDatabase(file);
  });
}
