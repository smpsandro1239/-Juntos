// +JUNTOS
// Ficheiro: lib/data/local/models/favorite.dart
// Descrição: Modelo de dados local para favoritos (Drift)
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get poiId => integer()();
  TextColumn get poiName => text()();
  TextColumn get poiCategory => text()();
  TextColumn get poiAddress => text()();
  RealColumn get poiLatitude => real()();
  RealColumn get poiLongitude => real()();
  TextColumn get poiPrice => text()();
  BoolColumn get poiIsFree => boolean().withDefault(const Constant(false))();
  IntColumn get idadeMin => integer().withDefault(const Constant(0))();
  IntColumn get idadeMax => integer().withDefault(const Constant(99))();
  RealColumn get precoMin => real().withDefault(const Constant(0.0))();
  RealColumn get precoMax => real().withDefault(const Constant(0.0))();
  BoolColumn get acessibilidade => boolean().withDefault(const Constant(false))();
  BoolColumn get estacionamento => boolean().withDefault(const Constant(false))();
  BoolColumn get wc => boolean().withDefault(const Constant(false))();
  BoolColumn get cafetaria => boolean().withDefault(const Constant(false))();
  BoolColumn get interior => boolean().withDefault(const Constant(false))();
  BoolColumn get exterior => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'UNIQUE(poi_id)', // Evitar duplicados
  ];
}
