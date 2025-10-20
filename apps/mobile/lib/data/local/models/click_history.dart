// +JUNTOS
// Ficheiro: lib/data/local/models/click_history.dart
// Descrição: Modelo de dados local para o histórico de cliques (Drift)
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';

class ClickHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get poiId => integer()();
  DateTimeColumn get clickedAt => dateTime().withDefault(currentDateAndTime)();
}
