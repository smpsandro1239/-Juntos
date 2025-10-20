// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _poiIdMeta = const VerificationMeta('poiId');
  @override
  late final GeneratedColumn<int> poiId = GeneratedColumn<int>(
      'poi_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _poiNameMeta =
      const VerificationMeta('poiName');
  @override
  late final GeneratedColumn<String> poiName = GeneratedColumn<String>(
      'poi_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _poiCategoryMeta =
      const VerificationMeta('poiCategory');
  @override
  late final GeneratedColumn<String> poiCategory = GeneratedColumn<String>(
      'poi_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _poiAddressMeta =
      const VerificationMeta('poiAddress');
  @override
  late final GeneratedColumn<String> poiAddress = GeneratedColumn<String>(
      'poi_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _poiLatitudeMeta =
      const VerificationMeta('poiLatitude');
  @override
  late final GeneratedColumn<double> poiLatitude = GeneratedColumn<double>(
      'poi_latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _poiLongitudeMeta =
      const VerificationMeta('poiLongitude');
  @override
  late final GeneratedColumn<double> poiLongitude = GeneratedColumn<double>(
      'poi_longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _poiPriceMeta =
      const VerificationMeta('poiPrice');
  @override
  late final GeneratedColumn<String> poiPrice = GeneratedColumn<String>(
      'poi_price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _poiIsFreeMeta =
      const VerificationMeta('poiIsFree');
  @override
  late final GeneratedColumn<bool> poiIsFree = GeneratedColumn<bool>(
      'poi_is_free', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("poi_is_free" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _idadeMinMeta =
      const VerificationMeta('idadeMin');
  @override
  late final GeneratedColumn<int> idadeMin = GeneratedColumn<int>(
      'idade_min', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _idadeMaxMeta =
      const VerificationMeta('idadeMax');
  @override
  late final GeneratedColumn<int> idadeMax = GeneratedColumn<int>(
      'idade_max', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(99));
  static const VerificationMeta _precoMinMeta =
      const VerificationMeta('precoMin');
  @override
  late final GeneratedColumn<double> precoMin = GeneratedColumn<double>(
      'preco_min', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _precoMaxMeta =
      const VerificationMeta('precoMax');
  @override
  late final GeneratedColumn<double> precoMax = GeneratedColumn<double>(
      'preco_max', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _acessibilidadeMeta =
      const VerificationMeta('acessibilidade');
  @override
  late final GeneratedColumn<bool> acessibilidade = GeneratedColumn<bool>(
      'acessibilidade', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("acessibilidade" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _estacionamentoMeta =
      const VerificationMeta('estacionamento');
  @override
  late final GeneratedColumn<bool> estacionamento = GeneratedColumn<bool>(
      'estacionamento', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("estacionamento" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _wcMeta = const VerificationMeta('wc');
  @override
  late final GeneratedColumn<bool> wc = GeneratedColumn<bool>(
      'wc', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("wc" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _cafetariaMeta =
      const VerificationMeta('cafetaria');
  @override
  late final GeneratedColumn<bool> cafetaria = GeneratedColumn<bool>(
      'cafetaria', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("cafetaria" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _interiorMeta =
      const VerificationMeta('interior');
  @override
  late final GeneratedColumn<bool> interior = GeneratedColumn<bool>(
      'interior', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("interior" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _exteriorMeta =
      const VerificationMeta('exterior');
  @override
  late final GeneratedColumn<bool> exterior = GeneratedColumn<bool>(
      'exterior', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("exterior" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        poiId,
        poiName,
        poiCategory,
        poiAddress,
        poiLatitude,
        poiLongitude,
        poiPrice,
        poiIsFree,
        idadeMin,
        idadeMax,
        precoMin,
        precoMax,
        acessibilidade,
        estacionamento,
        wc,
        cafetaria,
        interior,
        exterior,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('poi_id')) {
      context.handle(
          _poiIdMeta, poiId.isAcceptableOrUnknown(data['poi_id']!, _poiIdMeta));
    } else if (isInserting) {
      context.missing(_poiIdMeta);
    }
    if (data.containsKey('poi_name')) {
      context.handle(_poiNameMeta,
          poiName.isAcceptableOrUnknown(data['poi_name']!, _poiNameMeta));
    } else if (isInserting) {
      context.missing(_poiNameMeta);
    }
    if (data.containsKey('poi_category')) {
      context.handle(
          _poiCategoryMeta,
          poiCategory.isAcceptableOrUnknown(
              data['poi_category']!, _poiCategoryMeta));
    } else if (isInserting) {
      context.missing(_poiCategoryMeta);
    }
    if (data.containsKey('poi_address')) {
      context.handle(
          _poiAddressMeta,
          poiAddress.isAcceptableOrUnknown(
              data['poi_address']!, _poiAddressMeta));
    } else if (isInserting) {
      context.missing(_poiAddressMeta);
    }
    if (data.containsKey('poi_latitude')) {
      context.handle(
          _poiLatitudeMeta,
          poiLatitude.isAcceptableOrUnknown(
              data['poi_latitude']!, _poiLatitudeMeta));
    } else if (isInserting) {
      context.missing(_poiLatitudeMeta);
    }
    if (data.containsKey('poi_longitude')) {
      context.handle(
          _poiLongitudeMeta,
          poiLongitude.isAcceptableOrUnknown(
              data['poi_longitude']!, _poiLongitudeMeta));
    } else if (isInserting) {
      context.missing(_poiLongitudeMeta);
    }
    if (data.containsKey('poi_price')) {
      context.handle(_poiPriceMeta,
          poiPrice.isAcceptableOrUnknown(data['poi_price']!, _poiPriceMeta));
    } else if (isInserting) {
      context.missing(_poiPriceMeta);
    }
    if (data.containsKey('poi_is_free')) {
      context.handle(
          _poiIsFreeMeta,
          poiIsFree.isAcceptableOrUnknown(
              data['poi_is_free']!, _poiIsFreeMeta));
    }
    if (data.containsKey('idade_min')) {
      context.handle(_idadeMinMeta,
          idadeMin.isAcceptableOrUnknown(data['idade_min']!, _idadeMinMeta));
    }
    if (data.containsKey('idade_max')) {
      context.handle(_idadeMaxMeta,
          idadeMax.isAcceptableOrUnknown(data['idade_max']!, _idadeMaxMeta));
    }
    if (data.containsKey('preco_min')) {
      context.handle(_precoMinMeta,
          precoMin.isAcceptableOrUnknown(data['preco_min']!, _precoMinMeta));
    }
    if (data.containsKey('preco_max')) {
      context.handle(_precoMaxMeta,
          precoMax.isAcceptableOrUnknown(data['preco_max']!, _precoMaxMeta));
    }
    if (data.containsKey('acessibilidade')) {
      context.handle(
          _acessibilidadeMeta,
          acessibilidade.isAcceptableOrUnknown(
              data['acessibilidade']!, _acessibilidadeMeta));
    }
    if (data.containsKey('estacionamento')) {
      context.handle(
          _estacionamentoMeta,
          estacionamento.isAcceptableOrUnknown(
              data['estacionamento']!, _estacionamentoMeta));
    }
    if (data.containsKey('wc')) {
      context.handle(_wcMeta, wc.isAcceptableOrUnknown(data['wc']!, _wcMeta));
    }
    if (data.containsKey('cafetaria')) {
      context.handle(_cafetariaMeta,
          cafetaria.isAcceptableOrUnknown(data['cafetaria']!, _cafetariaMeta));
    }
    if (data.containsKey('interior')) {
      context.handle(_interiorMeta,
          interior.isAcceptableOrUnknown(data['interior']!, _interiorMeta));
    }
    if (data.containsKey('exterior')) {
      context.handle(_exteriorMeta,
          exterior.isAcceptableOrUnknown(data['exterior']!, _exteriorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      poiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}poi_id'])!,
      poiName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poi_name'])!,
      poiCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poi_category'])!,
      poiAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poi_address'])!,
      poiLatitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}poi_latitude'])!,
      poiLongitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}poi_longitude'])!,
      poiPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poi_price'])!,
      poiIsFree: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}poi_is_free'])!,
      idadeMin: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idade_min'])!,
      idadeMax: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idade_max'])!,
      precoMin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}preco_min'])!,
      precoMax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}preco_max'])!,
      acessibilidade: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}acessibilidade'])!,
      estacionamento: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}estacionamento'])!,
      wc: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}wc'])!,
      cafetaria: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}cafetaria'])!,
      interior: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}interior'])!,
      exterior: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}exterior'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int poiId;
  final String poiName;
  final String poiCategory;
  final String poiAddress;
  final double poiLatitude;
  final double poiLongitude;
  final String poiPrice;
  final bool poiIsFree;
  final int idadeMin;
  final int idadeMax;
  final double precoMin;
  final double precoMax;
  final bool acessibilidade;
  final bool estacionamento;
  final bool wc;
  final bool cafetaria;
  final bool interior;
  final bool exterior;
  final DateTime createdAt;
  const Favorite(
      {required this.id,
      required this.poiId,
      required this.poiName,
      required this.poiCategory,
      required this.poiAddress,
      required this.poiLatitude,
      required this.poiLongitude,
      required this.poiPrice,
      required this.poiIsFree,
      required this.idadeMin,
      required this.idadeMax,
      required this.precoMin,
      required this.precoMax,
      required this.acessibilidade,
      required this.estacionamento,
      required this.wc,
      required this.cafetaria,
      required this.interior,
      required this.exterior,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['poi_id'] = Variable<int>(poiId);
    map['poi_name'] = Variable<String>(poiName);
    map['poi_category'] = Variable<String>(poiCategory);
    map['poi_address'] = Variable<String>(poiAddress);
    map['poi_latitude'] = Variable<double>(poiLatitude);
    map['poi_longitude'] = Variable<double>(poiLongitude);
    map['poi_price'] = Variable<String>(poiPrice);
    map['poi_is_free'] = Variable<bool>(poiIsFree);
    map['idade_min'] = Variable<int>(idadeMin);
    map['idade_max'] = Variable<int>(idadeMax);
    map['preco_min'] = Variable<double>(precoMin);
    map['preco_max'] = Variable<double>(precoMax);
    map['acessibilidade'] = Variable<bool>(acessibilidade);
    map['estacionamento'] = Variable<bool>(estacionamento);
    map['wc'] = Variable<bool>(wc);
    map['cafetaria'] = Variable<bool>(cafetaria);
    map['interior'] = Variable<bool>(interior);
    map['exterior'] = Variable<bool>(exterior);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      poiId: Value(poiId),
      poiName: Value(poiName),
      poiCategory: Value(poiCategory),
      poiAddress: Value(poiAddress),
      poiLatitude: Value(poiLatitude),
      poiLongitude: Value(poiLongitude),
      poiPrice: Value(poiPrice),
      poiIsFree: Value(poiIsFree),
      idadeMin: Value(idadeMin),
      idadeMax: Value(idadeMax),
      precoMin: Value(precoMin),
      precoMax: Value(precoMax),
      acessibilidade: Value(acessibilidade),
      estacionamento: Value(estacionamento),
      wc: Value(wc),
      cafetaria: Value(cafetaria),
      interior: Value(interior),
      exterior: Value(exterior),
      createdAt: Value(createdAt),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      poiId: serializer.fromJson<int>(json['poiId']),
      poiName: serializer.fromJson<String>(json['poiName']),
      poiCategory: serializer.fromJson<String>(json['poiCategory']),
      poiAddress: serializer.fromJson<String>(json['poiAddress']),
      poiLatitude: serializer.fromJson<double>(json['poiLatitude']),
      poiLongitude: serializer.fromJson<double>(json['poiLongitude']),
      poiPrice: serializer.fromJson<String>(json['poiPrice']),
      poiIsFree: serializer.fromJson<bool>(json['poiIsFree']),
      idadeMin: serializer.fromJson<int>(json['idadeMin']),
      idadeMax: serializer.fromJson<int>(json['idadeMax']),
      precoMin: serializer.fromJson<double>(json['precoMin']),
      precoMax: serializer.fromJson<double>(json['precoMax']),
      acessibilidade: serializer.fromJson<bool>(json['acessibilidade']),
      estacionamento: serializer.fromJson<bool>(json['estacionamento']),
      wc: serializer.fromJson<bool>(json['wc']),
      cafetaria: serializer.fromJson<bool>(json['cafetaria']),
      interior: serializer.fromJson<bool>(json['interior']),
      exterior: serializer.fromJson<bool>(json['exterior']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'poiId': serializer.toJson<int>(poiId),
      'poiName': serializer.toJson<String>(poiName),
      'poiCategory': serializer.toJson<String>(poiCategory),
      'poiAddress': serializer.toJson<String>(poiAddress),
      'poiLatitude': serializer.toJson<double>(poiLatitude),
      'poiLongitude': serializer.toJson<double>(poiLongitude),
      'poiPrice': serializer.toJson<String>(poiPrice),
      'poiIsFree': serializer.toJson<bool>(poiIsFree),
      'idadeMin': serializer.toJson<int>(idadeMin),
      'idadeMax': serializer.toJson<int>(idadeMax),
      'precoMin': serializer.toJson<double>(precoMin),
      'precoMax': serializer.toJson<double>(precoMax),
      'acessibilidade': serializer.toJson<bool>(acessibilidade),
      'estacionamento': serializer.toJson<bool>(estacionamento),
      'wc': serializer.toJson<bool>(wc),
      'cafetaria': serializer.toJson<bool>(cafetaria),
      'interior': serializer.toJson<bool>(interior),
      'exterior': serializer.toJson<bool>(exterior),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Favorite copyWith(
          {int? id,
          int? poiId,
          String? poiName,
          String? poiCategory,
          String? poiAddress,
          double? poiLatitude,
          double? poiLongitude,
          String? poiPrice,
          bool? poiIsFree,
          int? idadeMin,
          int? idadeMax,
          double? precoMin,
          double? precoMax,
          bool? acessibilidade,
          bool? estacionamento,
          bool? wc,
          bool? cafetaria,
          bool? interior,
          bool? exterior,
          DateTime? createdAt}) =>
      Favorite(
        id: id ?? this.id,
        poiId: poiId ?? this.poiId,
        poiName: poiName ?? this.poiName,
        poiCategory: poiCategory ?? this.poiCategory,
        poiAddress: poiAddress ?? this.poiAddress,
        poiLatitude: poiLatitude ?? this.poiLatitude,
        poiLongitude: poiLongitude ?? this.poiLongitude,
        poiPrice: poiPrice ?? this.poiPrice,
        poiIsFree: poiIsFree ?? this.poiIsFree,
        idadeMin: idadeMin ?? this.idadeMin,
        idadeMax: idadeMax ?? this.idadeMax,
        precoMin: precoMin ?? this.precoMin,
        precoMax: precoMax ?? this.precoMax,
        acessibilidade: acessibilidade ?? this.acessibilidade,
        estacionamento: estacionamento ?? this.estacionamento,
        wc: wc ?? this.wc,
        cafetaria: cafetaria ?? this.cafetaria,
        interior: interior ?? this.interior,
        exterior: exterior ?? this.exterior,
        createdAt: createdAt ?? this.createdAt,
      );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      poiName: data.poiName.present ? data.poiName.value : this.poiName,
      poiCategory:
          data.poiCategory.present ? data.poiCategory.value : this.poiCategory,
      poiAddress:
          data.poiAddress.present ? data.poiAddress.value : this.poiAddress,
      poiLatitude:
          data.poiLatitude.present ? data.poiLatitude.value : this.poiLatitude,
      poiLongitude: data.poiLongitude.present
          ? data.poiLongitude.value
          : this.poiLongitude,
      poiPrice: data.poiPrice.present ? data.poiPrice.value : this.poiPrice,
      poiIsFree: data.poiIsFree.present ? data.poiIsFree.value : this.poiIsFree,
      idadeMin: data.idadeMin.present ? data.idadeMin.value : this.idadeMin,
      idadeMax: data.idadeMax.present ? data.idadeMax.value : this.idadeMax,
      precoMin: data.precoMin.present ? data.precoMin.value : this.precoMin,
      precoMax: data.precoMax.present ? data.precoMax.value : this.precoMax,
      acessibilidade: data.acessibilidade.present
          ? data.acessibilidade.value
          : this.acessibilidade,
      estacionamento: data.estacionamento.present
          ? data.estacionamento.value
          : this.estacionamento,
      wc: data.wc.present ? data.wc.value : this.wc,
      cafetaria: data.cafetaria.present ? data.cafetaria.value : this.cafetaria,
      interior: data.interior.present ? data.interior.value : this.interior,
      exterior: data.exterior.present ? data.exterior.value : this.exterior,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('poiName: $poiName, ')
          ..write('poiCategory: $poiCategory, ')
          ..write('poiAddress: $poiAddress, ')
          ..write('poiLatitude: $poiLatitude, ')
          ..write('poiLongitude: $poiLongitude, ')
          ..write('poiPrice: $poiPrice, ')
          ..write('poiIsFree: $poiIsFree, ')
          ..write('idadeMin: $idadeMin, ')
          ..write('idadeMax: $idadeMax, ')
          ..write('precoMin: $precoMin, ')
          ..write('precoMax: $precoMax, ')
          ..write('acessibilidade: $acessibilidade, ')
          ..write('estacionamento: $estacionamento, ')
          ..write('wc: $wc, ')
          ..write('cafetaria: $cafetaria, ')
          ..write('interior: $interior, ')
          ..write('exterior: $exterior, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      poiId,
      poiName,
      poiCategory,
      poiAddress,
      poiLatitude,
      poiLongitude,
      poiPrice,
      poiIsFree,
      idadeMin,
      idadeMax,
      precoMin,
      precoMax,
      acessibilidade,
      estacionamento,
      wc,
      cafetaria,
      interior,
      exterior,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.poiId == this.poiId &&
          other.poiName == this.poiName &&
          other.poiCategory == this.poiCategory &&
          other.poiAddress == this.poiAddress &&
          other.poiLatitude == this.poiLatitude &&
          other.poiLongitude == this.poiLongitude &&
          other.poiPrice == this.poiPrice &&
          other.poiIsFree == this.poiIsFree &&
          other.idadeMin == this.idadeMin &&
          other.idadeMax == this.idadeMax &&
          other.precoMin == this.precoMin &&
          other.precoMax == this.precoMax &&
          other.acessibilidade == this.acessibilidade &&
          other.estacionamento == this.estacionamento &&
          other.wc == this.wc &&
          other.cafetaria == this.cafetaria &&
          other.interior == this.interior &&
          other.exterior == this.exterior &&
          other.createdAt == this.createdAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> poiId;
  final Value<String> poiName;
  final Value<String> poiCategory;
  final Value<String> poiAddress;
  final Value<double> poiLatitude;
  final Value<double> poiLongitude;
  final Value<String> poiPrice;
  final Value<bool> poiIsFree;
  final Value<int> idadeMin;
  final Value<int> idadeMax;
  final Value<double> precoMin;
  final Value<double> precoMax;
  final Value<bool> acessibilidade;
  final Value<bool> estacionamento;
  final Value<bool> wc;
  final Value<bool> cafetaria;
  final Value<bool> interior;
  final Value<bool> exterior;
  final Value<DateTime> createdAt;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.poiId = const Value.absent(),
    this.poiName = const Value.absent(),
    this.poiCategory = const Value.absent(),
    this.poiAddress = const Value.absent(),
    this.poiLatitude = const Value.absent(),
    this.poiLongitude = const Value.absent(),
    this.poiPrice = const Value.absent(),
    this.poiIsFree = const Value.absent(),
    this.idadeMin = const Value.absent(),
    this.idadeMax = const Value.absent(),
    this.precoMin = const Value.absent(),
    this.precoMax = const Value.absent(),
    this.acessibilidade = const Value.absent(),
    this.estacionamento = const Value.absent(),
    this.wc = const Value.absent(),
    this.cafetaria = const Value.absent(),
    this.interior = const Value.absent(),
    this.exterior = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int poiId,
    required String poiName,
    required String poiCategory,
    required String poiAddress,
    required double poiLatitude,
    required double poiLongitude,
    required String poiPrice,
    this.poiIsFree = const Value.absent(),
    this.idadeMin = const Value.absent(),
    this.idadeMax = const Value.absent(),
    this.precoMin = const Value.absent(),
    this.precoMax = const Value.absent(),
    this.acessibilidade = const Value.absent(),
    this.estacionamento = const Value.absent(),
    this.wc = const Value.absent(),
    this.cafetaria = const Value.absent(),
    this.interior = const Value.absent(),
    this.exterior = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : poiId = Value(poiId),
        poiName = Value(poiName),
        poiCategory = Value(poiCategory),
        poiAddress = Value(poiAddress),
        poiLatitude = Value(poiLatitude),
        poiLongitude = Value(poiLongitude),
        poiPrice = Value(poiPrice);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? poiId,
    Expression<String>? poiName,
    Expression<String>? poiCategory,
    Expression<String>? poiAddress,
    Expression<double>? poiLatitude,
    Expression<double>? poiLongitude,
    Expression<String>? poiPrice,
    Expression<bool>? poiIsFree,
    Expression<int>? idadeMin,
    Expression<int>? idadeMax,
    Expression<double>? precoMin,
    Expression<double>? precoMax,
    Expression<bool>? acessibilidade,
    Expression<bool>? estacionamento,
    Expression<bool>? wc,
    Expression<bool>? cafetaria,
    Expression<bool>? interior,
    Expression<bool>? exterior,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poiId != null) 'poi_id': poiId,
      if (poiName != null) 'poi_name': poiName,
      if (poiCategory != null) 'poi_category': poiCategory,
      if (poiAddress != null) 'poi_address': poiAddress,
      if (poiLatitude != null) 'poi_latitude': poiLatitude,
      if (poiLongitude != null) 'poi_longitude': poiLongitude,
      if (poiPrice != null) 'poi_price': poiPrice,
      if (poiIsFree != null) 'poi_is_free': poiIsFree,
      if (idadeMin != null) 'idade_min': idadeMin,
      if (idadeMax != null) 'idade_max': idadeMax,
      if (precoMin != null) 'preco_min': precoMin,
      if (precoMax != null) 'preco_max': precoMax,
      if (acessibilidade != null) 'acessibilidade': acessibilidade,
      if (estacionamento != null) 'estacionamento': estacionamento,
      if (wc != null) 'wc': wc,
      if (cafetaria != null) 'cafetaria': cafetaria,
      if (interior != null) 'interior': interior,
      if (exterior != null) 'exterior': exterior,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int>? id,
      Value<int>? poiId,
      Value<String>? poiName,
      Value<String>? poiCategory,
      Value<String>? poiAddress,
      Value<double>? poiLatitude,
      Value<double>? poiLongitude,
      Value<String>? poiPrice,
      Value<bool>? poiIsFree,
      Value<int>? idadeMin,
      Value<int>? idadeMax,
      Value<double>? precoMin,
      Value<double>? precoMax,
      Value<bool>? acessibilidade,
      Value<bool>? estacionamento,
      Value<bool>? wc,
      Value<bool>? cafetaria,
      Value<bool>? interior,
      Value<bool>? exterior,
      Value<DateTime>? createdAt}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      poiId: poiId ?? this.poiId,
      poiName: poiName ?? this.poiName,
      poiCategory: poiCategory ?? this.poiCategory,
      poiAddress: poiAddress ?? this.poiAddress,
      poiLatitude: poiLatitude ?? this.poiLatitude,
      poiLongitude: poiLongitude ?? this.poiLongitude,
      poiPrice: poiPrice ?? this.poiPrice,
      poiIsFree: poiIsFree ?? this.poiIsFree,
      idadeMin: idadeMin ?? this.idadeMin,
      idadeMax: idadeMax ?? this.idadeMax,
      precoMin: precoMin ?? this.precoMin,
      precoMax: precoMax ?? this.precoMax,
      acessibilidade: acessibilidade ?? this.acessibilidade,
      estacionamento: estacionamento ?? this.estacionamento,
      wc: wc ?? this.wc,
      cafetaria: cafetaria ?? this.cafetaria,
      interior: interior ?? this.interior,
      exterior: exterior ?? this.exterior,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (poiId.present) {
      map['poi_id'] = Variable<int>(poiId.value);
    }
    if (poiName.present) {
      map['poi_name'] = Variable<String>(poiName.value);
    }
    if (poiCategory.present) {
      map['poi_category'] = Variable<String>(poiCategory.value);
    }
    if (poiAddress.present) {
      map['poi_address'] = Variable<String>(poiAddress.value);
    }
    if (poiLatitude.present) {
      map['poi_latitude'] = Variable<double>(poiLatitude.value);
    }
    if (poiLongitude.present) {
      map['poi_longitude'] = Variable<double>(poiLongitude.value);
    }
    if (poiPrice.present) {
      map['poi_price'] = Variable<String>(poiPrice.value);
    }
    if (poiIsFree.present) {
      map['poi_is_free'] = Variable<bool>(poiIsFree.value);
    }
    if (idadeMin.present) {
      map['idade_min'] = Variable<int>(idadeMin.value);
    }
    if (idadeMax.present) {
      map['idade_max'] = Variable<int>(idadeMax.value);
    }
    if (precoMin.present) {
      map['preco_min'] = Variable<double>(precoMin.value);
    }
    if (precoMax.present) {
      map['preco_max'] = Variable<double>(precoMax.value);
    }
    if (acessibilidade.present) {
      map['acessibilidade'] = Variable<bool>(acessibilidade.value);
    }
    if (estacionamento.present) {
      map['estacionamento'] = Variable<bool>(estacionamento.value);
    }
    if (wc.present) {
      map['wc'] = Variable<bool>(wc.value);
    }
    if (cafetaria.present) {
      map['cafetaria'] = Variable<bool>(cafetaria.value);
    }
    if (interior.present) {
      map['interior'] = Variable<bool>(interior.value);
    }
    if (exterior.present) {
      map['exterior'] = Variable<bool>(exterior.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('poiName: $poiName, ')
          ..write('poiCategory: $poiCategory, ')
          ..write('poiAddress: $poiAddress, ')
          ..write('poiLatitude: $poiLatitude, ')
          ..write('poiLongitude: $poiLongitude, ')
          ..write('poiPrice: $poiPrice, ')
          ..write('poiIsFree: $poiIsFree, ')
          ..write('idadeMin: $idadeMin, ')
          ..write('idadeMax: $idadeMax, ')
          ..write('precoMin: $precoMin, ')
          ..write('precoMax: $precoMax, ')
          ..write('acessibilidade: $acessibilidade, ')
          ..write('estacionamento: $estacionamento, ')
          ..write('wc: $wc, ')
          ..write('cafetaria: $cafetaria, ')
          ..write('interior: $interior, ')
          ..write('exterior: $exterior, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites];
}

typedef $$FavoritesTableCreateCompanionBuilder = FavoritesCompanion Function({
  Value<int> id,
  required int poiId,
  required String poiName,
  required String poiCategory,
  required String poiAddress,
  required double poiLatitude,
  required double poiLongitude,
  required String poiPrice,
  Value<bool> poiIsFree,
  Value<int> idadeMin,
  Value<int> idadeMax,
  Value<double> precoMin,
  Value<double> precoMax,
  Value<bool> acessibilidade,
  Value<bool> estacionamento,
  Value<bool> wc,
  Value<bool> cafetaria,
  Value<bool> interior,
  Value<bool> exterior,
  Value<DateTime> createdAt,
});
typedef $$FavoritesTableUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<int> id,
  Value<int> poiId,
  Value<String> poiName,
  Value<String> poiCategory,
  Value<String> poiAddress,
  Value<double> poiLatitude,
  Value<double> poiLongitude,
  Value<String> poiPrice,
  Value<bool> poiIsFree,
  Value<int> idadeMin,
  Value<int> idadeMax,
  Value<double> precoMin,
  Value<double> precoMax,
  Value<bool> acessibilidade,
  Value<bool> estacionamento,
  Value<bool> wc,
  Value<bool> cafetaria,
  Value<bool> interior,
  Value<bool> exterior,
  Value<DateTime> createdAt,
});

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get poiId => $composableBuilder(
      column: $table.poiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get poiName => $composableBuilder(
      column: $table.poiName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get poiCategory => $composableBuilder(
      column: $table.poiCategory, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get poiAddress => $composableBuilder(
      column: $table.poiAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get poiLatitude => $composableBuilder(
      column: $table.poiLatitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get poiLongitude => $composableBuilder(
      column: $table.poiLongitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get poiPrice => $composableBuilder(
      column: $table.poiPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get poiIsFree => $composableBuilder(
      column: $table.poiIsFree, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idadeMin => $composableBuilder(
      column: $table.idadeMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idadeMax => $composableBuilder(
      column: $table.idadeMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get precoMin => $composableBuilder(
      column: $table.precoMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get precoMax => $composableBuilder(
      column: $table.precoMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get acessibilidade => $composableBuilder(
      column: $table.acessibilidade,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get estacionamento => $composableBuilder(
      column: $table.estacionamento,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get wc => $composableBuilder(
      column: $table.wc, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get cafetaria => $composableBuilder(
      column: $table.cafetaria, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get interior => $composableBuilder(
      column: $table.interior, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get exterior => $composableBuilder(
      column: $table.exterior, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get poiId => $composableBuilder(
      column: $table.poiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get poiName => $composableBuilder(
      column: $table.poiName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get poiCategory => $composableBuilder(
      column: $table.poiCategory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get poiAddress => $composableBuilder(
      column: $table.poiAddress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get poiLatitude => $composableBuilder(
      column: $table.poiLatitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get poiLongitude => $composableBuilder(
      column: $table.poiLongitude,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get poiPrice => $composableBuilder(
      column: $table.poiPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get poiIsFree => $composableBuilder(
      column: $table.poiIsFree, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idadeMin => $composableBuilder(
      column: $table.idadeMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idadeMax => $composableBuilder(
      column: $table.idadeMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get precoMin => $composableBuilder(
      column: $table.precoMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get precoMax => $composableBuilder(
      column: $table.precoMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get acessibilidade => $composableBuilder(
      column: $table.acessibilidade,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get estacionamento => $composableBuilder(
      column: $table.estacionamento,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get wc => $composableBuilder(
      column: $table.wc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get cafetaria => $composableBuilder(
      column: $table.cafetaria, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get interior => $composableBuilder(
      column: $table.interior, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get exterior => $composableBuilder(
      column: $table.exterior, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get poiId =>
      $composableBuilder(column: $table.poiId, builder: (column) => column);

  GeneratedColumn<String> get poiName =>
      $composableBuilder(column: $table.poiName, builder: (column) => column);

  GeneratedColumn<String> get poiCategory => $composableBuilder(
      column: $table.poiCategory, builder: (column) => column);

  GeneratedColumn<String> get poiAddress => $composableBuilder(
      column: $table.poiAddress, builder: (column) => column);

  GeneratedColumn<double> get poiLatitude => $composableBuilder(
      column: $table.poiLatitude, builder: (column) => column);

  GeneratedColumn<double> get poiLongitude => $composableBuilder(
      column: $table.poiLongitude, builder: (column) => column);

  GeneratedColumn<String> get poiPrice =>
      $composableBuilder(column: $table.poiPrice, builder: (column) => column);

  GeneratedColumn<bool> get poiIsFree =>
      $composableBuilder(column: $table.poiIsFree, builder: (column) => column);

  GeneratedColumn<int> get idadeMin =>
      $composableBuilder(column: $table.idadeMin, builder: (column) => column);

  GeneratedColumn<int> get idadeMax =>
      $composableBuilder(column: $table.idadeMax, builder: (column) => column);

  GeneratedColumn<double> get precoMin =>
      $composableBuilder(column: $table.precoMin, builder: (column) => column);

  GeneratedColumn<double> get precoMax =>
      $composableBuilder(column: $table.precoMax, builder: (column) => column);

  GeneratedColumn<bool> get acessibilidade => $composableBuilder(
      column: $table.acessibilidade, builder: (column) => column);

  GeneratedColumn<bool> get estacionamento => $composableBuilder(
      column: $table.estacionamento, builder: (column) => column);

  GeneratedColumn<bool> get wc =>
      $composableBuilder(column: $table.wc, builder: (column) => column);

  GeneratedColumn<bool> get cafetaria =>
      $composableBuilder(column: $table.cafetaria, builder: (column) => column);

  GeneratedColumn<bool> get interior =>
      $composableBuilder(column: $table.interior, builder: (column) => column);

  GeneratedColumn<bool> get exterior =>
      $composableBuilder(column: $table.exterior, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoritesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableAnnotationComposer,
    $$FavoritesTableCreateCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder,
    (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
    Favorite,
    PrefetchHooks Function()> {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> poiId = const Value.absent(),
            Value<String> poiName = const Value.absent(),
            Value<String> poiCategory = const Value.absent(),
            Value<String> poiAddress = const Value.absent(),
            Value<double> poiLatitude = const Value.absent(),
            Value<double> poiLongitude = const Value.absent(),
            Value<String> poiPrice = const Value.absent(),
            Value<bool> poiIsFree = const Value.absent(),
            Value<int> idadeMin = const Value.absent(),
            Value<int> idadeMax = const Value.absent(),
            Value<double> precoMin = const Value.absent(),
            Value<double> precoMax = const Value.absent(),
            Value<bool> acessibilidade = const Value.absent(),
            Value<bool> estacionamento = const Value.absent(),
            Value<bool> wc = const Value.absent(),
            Value<bool> cafetaria = const Value.absent(),
            Value<bool> interior = const Value.absent(),
            Value<bool> exterior = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesCompanion(
            id: id,
            poiId: poiId,
            poiName: poiName,
            poiCategory: poiCategory,
            poiAddress: poiAddress,
            poiLatitude: poiLatitude,
            poiLongitude: poiLongitude,
            poiPrice: poiPrice,
            poiIsFree: poiIsFree,
            idadeMin: idadeMin,
            idadeMax: idadeMax,
            precoMin: precoMin,
            precoMax: precoMax,
            acessibilidade: acessibilidade,
            estacionamento: estacionamento,
            wc: wc,
            cafetaria: cafetaria,
            interior: interior,
            exterior: exterior,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int poiId,
            required String poiName,
            required String poiCategory,
            required String poiAddress,
            required double poiLatitude,
            required double poiLongitude,
            required String poiPrice,
            Value<bool> poiIsFree = const Value.absent(),
            Value<int> idadeMin = const Value.absent(),
            Value<int> idadeMax = const Value.absent(),
            Value<double> precoMin = const Value.absent(),
            Value<double> precoMax = const Value.absent(),
            Value<bool> acessibilidade = const Value.absent(),
            Value<bool> estacionamento = const Value.absent(),
            Value<bool> wc = const Value.absent(),
            Value<bool> cafetaria = const Value.absent(),
            Value<bool> interior = const Value.absent(),
            Value<bool> exterior = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesCompanion.insert(
            id: id,
            poiId: poiId,
            poiName: poiName,
            poiCategory: poiCategory,
            poiAddress: poiAddress,
            poiLatitude: poiLatitude,
            poiLongitude: poiLongitude,
            poiPrice: poiPrice,
            poiIsFree: poiIsFree,
            idadeMin: idadeMin,
            idadeMax: idadeMax,
            precoMin: precoMin,
            precoMax: precoMax,
            acessibilidade: acessibilidade,
            estacionamento: estacionamento,
            wc: wc,
            cafetaria: cafetaria,
            interior: interior,
            exterior: exterior,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoritesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableAnnotationComposer,
    $$FavoritesTableCreateCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder,
    (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
    Favorite,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
}
