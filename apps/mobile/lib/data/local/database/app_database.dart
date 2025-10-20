// +JUNTOS
// Ficheiro: lib/data/local/database/app_database.dart
// Descrição: Configuração do banco de dados Drift SQLite
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:drift/native.dart';
import '../models/favorite.dart';
import '../models/click_history.dart';
import '../daos/favorites_dao.dart';
import '../daos/click_history_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Favorites, ClickHistory], daos: [FavoritesDao, ClickHistoryDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // Incrementar a versão do esquema devido à nova tabela

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // Adicionar a tabela clickHistory na migração
        await m.createTable(clickHistory);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'juntos.db'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
