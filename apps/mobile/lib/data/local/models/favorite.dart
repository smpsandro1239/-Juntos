// +JUNTOS
// Ficheiro: lib/data/local/models/favorite.dart
// Descrição: Modelo de dados local para favoritos (Drift), espelhando o modelo Poi.
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get poiId => integer()();
  TextColumn get nome => text()();
  TextColumn get descricao => text().nullable()();
  TextColumn get categoria => text()();
  IntColumn get idadeMin => integer()();
  IntColumn get idadeMax => integer()();
  RealColumn get precoMin => real()();
  RealColumn get precoMax => real()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get morada => text().nullable()();
  TextColumn get codigoPostal => text().nullable()();
  TextColumn get cidade => text().nullable()();
  TextColumn get distrito => text().nullable()();
  TextColumn get telefone => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get horarioAbertura => text().nullable()();
  TextColumn get horarioFecho => text().nullable()();
  BoolColumn get acessibilidade => boolean()();
  BoolColumn get estacionamento => boolean()();
  BoolColumn get wc => boolean()();
  BoolColumn get cafetaria => boolean()();
  BoolColumn get interior => boolean()();
  BoolColumn get exterior => boolean()();
  BoolColumn get ativo => boolean()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'UNIQUE(poi_id)', // Evitar duplicados
  ];
}
