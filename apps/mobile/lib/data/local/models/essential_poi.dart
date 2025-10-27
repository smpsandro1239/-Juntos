// +JUTOS
// Ficheiro: lib/data/local/models/essential_poi.dart
// Descrição: Modelo de dados para POIs do bundle essencial para uso offline
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:drift/drift.dart';

@DataClassName('EssentialPoiEntry')
class EssentialPois extends Table {
  @override
  String get tableName => 'essential_pois';

  IntColumn get id => integer()();
  TextColumn get nome => text()();
  TextColumn get descricao => text().nullable()();
  TextColumn get categoria => text()();
  TextColumn get subcategoria => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get morada => text().nullable()();
  TextColumn get cidade => text().nullable()();
  TextColumn get codPostal => text().nullable()();
  TextColumn get pais => text().nullable()();
  TextColumn get telefone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get website => text().nullable()();
  IntColumn get idadeMin => integer().nullable()();
  IntColumn get idadeMax => integer().nullable()();
  RealColumn get preco => real().nullable()();
  BoolColumn get isGratuito => boolean().nullable()();
  BoolColumn get isAcessivel => boolean().nullable()();
  IntColumn get duracao => integer().nullable()();
  TextColumn get horario => text().nullable()();
  TextColumn get tags => text().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
