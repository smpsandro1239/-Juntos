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
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'UNIQUE(poi_id)', // Evitar duplicados
  ];
}
