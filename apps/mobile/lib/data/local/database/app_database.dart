// +JUNTOS
// Ficheiro: lib/data/local/database/app_database.dart
// Descrição: Configuração do banco de dados Drift SQLite
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:drift/native.dart';
import '../models/favorite.dart';
import '../models/review.dart';
import '../models/click_history.dart';
import '../models/cached_poi.dart';
import '../models/essential_poi.dart';
import '../daos/favorites_dao.dart';
import '../daos/reviews_dao.dart';
import '../daos/click_history_dao.dart';
import '../daos/cached_pois_dao.dart';
import '../daos/essential_pois_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Favorites, Reviews, ClickHistory, CachedPois, EssentialPois],
  daos: [FavoritesDao, ReviewsDao, ClickHistoryDao, CachedPoisDao, EssentialPoisDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 6; // Incrementar a versão

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(reviews);
          }
          if (from < 3) {
            await m.deleteTable('favorites');
            await m.createTable(favorites);
          }
          if (from < 4) {
            await m.createTable(clickHistory);
          }
          if (from < 5) {
            await m.createTable(cachedPois);
          }
          if (from < 6) {
            await m.createTable(essentialPois);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'juntos.db'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
