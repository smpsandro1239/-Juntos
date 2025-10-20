// +JUNTOS
// Ficheiro: lib/data/local/models/review.dart
// Descrição: Modelo da tabela de avaliações para o Drift
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';

@DataClassName('Review')
class Reviews extends Table {
  @override
  String get tableName => 'reviews';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get poiId => integer()();
  IntColumn get rating => integer().check(rating.isBetween(const Constant(1), const Constant(5)))();
  TextColumn get comment => text().nullable()();
  TextColumn get userName => text().withDefault(const Constant('Anónimo'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
