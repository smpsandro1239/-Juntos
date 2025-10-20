// +JUNTOS
// Ficheiro: lib/data/local/models/cached_poi.dart
// Descrição: Modelo de dados local para POIs em cache (Drift)
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';

// Tabela para armazenar POIs para acesso offline
class CachedPois extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get poiId => integer().unique()();
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
  TextColumn get fotos => text().nullable().map(const StringListConverter())();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();
}

// Conversor para listas de strings, para guardar URLs de fotos
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();
  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}
