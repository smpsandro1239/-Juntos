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
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, poiId, poiName, poiCategory, poiAddress,
      poiLatitude, poiLongitude, poiPrice, poiIsFree, createdAt);
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
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews with TableInfo<$ReviewsTable, Review> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      check: () => ComparableExpr(rating)
          .isBetween(const Constant(1), const Constant(5)),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Anónimo'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, poiId, rating, comment, userName, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviews';
  @override
  VerificationContext validateIntegrity(Insertable<Review> instance,
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
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
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
  Review map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Review(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      poiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}poi_id'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(attachedDatabase, alias);
  }
}

class Review extends DataClass implements Insertable<Review> {
  final int id;
  final int poiId;
  final int rating;
  final String? comment;
  final String userName;
  final DateTime createdAt;
  const Review(
      {required this.id,
      required this.poiId,
      required this.rating,
      this.comment,
      required this.userName,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['poi_id'] = Variable<int>(poiId);
    map['rating'] = Variable<int>(rating);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['user_name'] = Variable<String>(userName);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      poiId: Value(poiId),
      rating: Value(rating),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      userName: Value(userName),
      createdAt: Value(createdAt),
    );
  }

  factory Review.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Review(
      id: serializer.fromJson<int>(json['id']),
      poiId: serializer.fromJson<int>(json['poiId']),
      rating: serializer.fromJson<int>(json['rating']),
      comment: serializer.fromJson<String?>(json['comment']),
      userName: serializer.fromJson<String>(json['userName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'poiId': serializer.toJson<int>(poiId),
      'rating': serializer.toJson<int>(rating),
      'comment': serializer.toJson<String?>(comment),
      'userName': serializer.toJson<String>(userName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Review copyWith(
          {int? id,
          int? poiId,
          int? rating,
          Value<String?> comment = const Value.absent(),
          String? userName,
          DateTime? createdAt}) =>
      Review(
        id: id ?? this.id,
        poiId: poiId ?? this.poiId,
        rating: rating ?? this.rating,
        comment: comment.present ? comment.value : this.comment,
        userName: userName ?? this.userName,
        createdAt: createdAt ?? this.createdAt,
      );
  Review copyWithCompanion(ReviewsCompanion data) {
    return Review(
      id: data.id.present ? data.id.value : this.id,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      rating: data.rating.present ? data.rating.value : this.rating,
      comment: data.comment.present ? data.comment.value : this.comment,
      userName: data.userName.present ? data.userName.value : this.userName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Review(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('rating: $rating, ')
          ..write('comment: $comment, ')
          ..write('userName: $userName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, poiId, rating, comment, userName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Review &&
          other.id == this.id &&
          other.poiId == this.poiId &&
          other.rating == this.rating &&
          other.comment == this.comment &&
          other.userName == this.userName &&
          other.createdAt == this.createdAt);
}

class ReviewsCompanion extends UpdateCompanion<Review> {
  final Value<int> id;
  final Value<int> poiId;
  final Value<int> rating;
  final Value<String?> comment;
  final Value<String> userName;
  final Value<DateTime> createdAt;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.poiId = const Value.absent(),
    this.rating = const Value.absent(),
    this.comment = const Value.absent(),
    this.userName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ReviewsCompanion.insert({
    this.id = const Value.absent(),
    required int poiId,
    required int rating,
    this.comment = const Value.absent(),
    this.userName = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : poiId = Value(poiId),
        rating = Value(rating);
  static Insertable<Review> custom({
    Expression<int>? id,
    Expression<int>? poiId,
    Expression<int>? rating,
    Expression<String>? comment,
    Expression<String>? userName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poiId != null) 'poi_id': poiId,
      if (rating != null) 'rating': rating,
      if (comment != null) 'comment': comment,
      if (userName != null) 'user_name': userName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ReviewsCompanion copyWith(
      {Value<int>? id,
      Value<int>? poiId,
      Value<int>? rating,
      Value<String?>? comment,
      Value<String>? userName,
      Value<DateTime>? createdAt}) {
    return ReviewsCompanion(
      id: id ?? this.id,
      poiId: poiId ?? this.poiId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      userName: userName ?? this.userName,
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
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('rating: $rating, ')
          ..write('comment: $comment, ')
          ..write('userName: $userName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  late final ReviewsDao reviewsDao = ReviewsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites, reviews];
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
typedef $$ReviewsTableCreateCompanionBuilder = ReviewsCompanion Function({
  Value<int> id,
  required int poiId,
  required int rating,
  Value<String?> comment,
  Value<String> userName,
  Value<DateTime> createdAt,
});
typedef $$ReviewsTableUpdateCompanionBuilder = ReviewsCompanion Function({
  Value<int> id,
  Value<int> poiId,
  Value<int> rating,
  Value<String?> comment,
  Value<String> userName,
  Value<DateTime> createdAt,
});

class $$ReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableFilterComposer({
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

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableOrderingComposer({
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

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userName => $composableBuilder(
      column: $table.userName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableAnnotationComposer({
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

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ReviewsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReviewsTable,
    Review,
    $$ReviewsTableFilterComposer,
    $$ReviewsTableOrderingComposer,
    $$ReviewsTableAnnotationComposer,
    $$ReviewsTableCreateCompanionBuilder,
    $$ReviewsTableUpdateCompanionBuilder,
    (Review, BaseReferences<_$AppDatabase, $ReviewsTable, Review>),
    Review,
    PrefetchHooks Function()> {
  $$ReviewsTableTableManager(_$AppDatabase db, $ReviewsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> poiId = const Value.absent(),
            Value<int> rating = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ReviewsCompanion(
            id: id,
            poiId: poiId,
            rating: rating,
            comment: comment,
            userName: userName,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int poiId,
            required int rating,
            Value<String?> comment = const Value.absent(),
            Value<String> userName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ReviewsCompanion.insert(
            id: id,
            poiId: poiId,
            rating: rating,
            comment: comment,
            userName: userName,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReviewsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReviewsTable,
    Review,
    $$ReviewsTableFilterComposer,
    $$ReviewsTableOrderingComposer,
    $$ReviewsTableAnnotationComposer,
    $$ReviewsTableCreateCompanionBuilder,
    $$ReviewsTableUpdateCompanionBuilder,
    (Review, BaseReferences<_$AppDatabase, $ReviewsTable, Review>),
    Review,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
}
