// +JUNTOS
// Ficheiro: lib/data/local/models/click_history.dart
// Descrição: Modelo de dados para o histórico de cliques do utilizador
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:drift/drift.dart';

@DataClassName('ClickHistoryEntry')
class ClickHistory extends Table {
  @override
  String get tableName => 'click_history';

  IntColumn get poiId => integer()();
  DateTimeColumn get clickedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {poiId, clickedAt};
}
