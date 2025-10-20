// +JUNTOS
// Ficheiro: lib/data/local/daos/click_history_dao.dart
// Descrição: Data Access Object para a tabela de histórico de cliques
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/click_history.dart';

part 'click_history_dao.g.dart';

@DriftAccessor(tables: [ClickHistory])
class ClickHistoryDao extends DatabaseAccessor<AppDatabase> with _$ClickHistoryDaoMixin {
  ClickHistoryDao(AppDatabase db) : super(db);

  /// Adiciona um registo de clique para um POI
  Future<void> addClick(int poiId) {
    final entry = ClickHistoryCompanion.insert(poiId: poiId);
    return into(clickHistory).insert(entry);
  }

  /// Retorna os IDs dos POIs clicados mais recentemente
  Future<List<int>> getRecentClicks({int limit = 50}) async {
    final query = select(clickHistory)
      ..orderBy([(t) => OrderingTerm(expression: t.clickedAt, mode: OrderingMode.desc)])
      ..limit(limit);

    final result = await query.get();
    return result.map((row) => row.poiId).toList();
  }

  /// Limpa o histórico de cliques mais antigo que um determinado número de dias
  Future<int> clearOldClicks(int days) {
    final threshold = DateTime.now().subtract(Duration(days: days));
    return (delete(clickHistory)..where((t) => t.clickedAt.isSmallerThanValue(threshold))).go();
  }
}
