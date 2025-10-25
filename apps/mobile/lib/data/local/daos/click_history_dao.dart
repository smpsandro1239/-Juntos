// +JUNTOS
// Ficheiro: lib/data/local/daos/click_history_dao.dart
// Descrição: Data Access Object para o histórico de cliques
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:drift/drift.dart';
import 'package:mobile/data/local/database/app_database.dart';
import 'package:mobile/data/local/models/click_history.dart';

part 'click_history_dao.g.dart';

@DriftAccessor(tables: [ClickHistory])
class ClickHistoryDao extends DatabaseAccessor<AppDatabase> with _$ClickHistoryDaoMixin {
  ClickHistoryDao(AppDatabase db) : super(db);

  // Adicionar um clique
  Future<void> addClick(int poiId) {
    return into(clickHistory).insert(
      ClickHistoryCompanion.insert(
        poiId: poiId,
        clickedAt: DateTime.now(),
      ),
    );
  }

  // Obter os IDs dos POIs mais clicados (ex: nos últimos 30 dias)
  Future<List<int>> getMostClickedPoiIds({
    int limit = 10,
    Duration since = const Duration(days: 30),
  }) {
    final query = select(clickHistory)
      ..where((tbl) => tbl.clickedAt.isAfter(DateTime.now().subtract(since)))
      ..groupBy([clickHistory.poiId])
      ..orderBy([
        OrderingTerm(
          expression: clickHistory.poiId.count(),
          mode: OrderingMode.desc,
        )
      ])
      ..limit(limit);

    return query.map((row) => row.poiId).get();
  }

  // Limpar histórico antigo
  Future<int> clearOldHistory({Duration olderThan = const Duration(days: 90)}) {
    return (delete(clickHistory)
          ..where((tbl) => tbl.clickedAt.isBefore(DateTime.now().subtract(olderThan))))
        .go();
  }
}
