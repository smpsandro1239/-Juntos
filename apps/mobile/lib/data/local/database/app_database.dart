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
import '../daos/favorites_dao.dart';
import '../daos/reviews_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Favorites, Reviews], daos: [FavoritesDao, ReviewsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // Incrementar a versão

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(reviews);
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
