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
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descricaoMeta =
      const VerificationMeta('descricao');
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
      'descricao', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoriaMeta =
      const VerificationMeta('categoria');
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
      'categoria', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idadeMinMeta =
      const VerificationMeta('idadeMin');
  @override
  late final GeneratedColumn<int> idadeMin = GeneratedColumn<int>(
      'idade_min', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idadeMaxMeta =
      const VerificationMeta('idadeMax');
  @override
  late final GeneratedColumn<int> idadeMax = GeneratedColumn<int>(
      'idade_max', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _precoMinMeta =
      const VerificationMeta('precoMin');
  @override
  late final GeneratedColumn<double> precoMin = GeneratedColumn<double>(
      'preco_min', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _precoMaxMeta =
      const VerificationMeta('precoMax');
  @override
  late final GeneratedColumn<double> precoMax = GeneratedColumn<double>(
      'preco_max', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _moradaMeta = const VerificationMeta('morada');
  @override
  late final GeneratedColumn<String> morada = GeneratedColumn<String>(
      'morada', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codigoPostalMeta =
      const VerificationMeta('codigoPostal');
  @override
  late final GeneratedColumn<String> codigoPostal = GeneratedColumn<String>(
      'codigo_postal', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cidadeMeta = const VerificationMeta('cidade');
  @override
  late final GeneratedColumn<String> cidade = GeneratedColumn<String>(
      'cidade', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _distritoMeta =
      const VerificationMeta('distrito');
  @override
  late final GeneratedColumn<String> distrito = GeneratedColumn<String>(
      'distrito', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _horarioAberturaMeta =
      const VerificationMeta('horarioAbertura');
  @override
  late final GeneratedColumn<String> horarioAbertura = GeneratedColumn<String>(
      'horario_abertura', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _horarioFechoMeta =
      const VerificationMeta('horarioFecho');
  @override
  late final GeneratedColumn<String> horarioFecho = GeneratedColumn<String>(
      'horario_fecho', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _acessibilidadeMeta =
      const VerificationMeta('acessibilidade');
  @override
  late final GeneratedColumn<bool> acessibilidade = GeneratedColumn<bool>(
      'acessibilidade', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("acessibilidade" IN (0, 1))'));
  static const VerificationMeta _estacionamentoMeta =
      const VerificationMeta('estacionamento');
  @override
  late final GeneratedColumn<bool> estacionamento = GeneratedColumn<bool>(
      'estacionamento', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("estacionamento" IN (0, 1))'));
  static const VerificationMeta _wcMeta = const VerificationMeta('wc');
  @override
  late final GeneratedColumn<bool> wc = GeneratedColumn<bool>(
      'wc', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("wc" IN (0, 1))'));
  static const VerificationMeta _cafetariaMeta =
      const VerificationMeta('cafetaria');
  @override
  late final GeneratedColumn<bool> cafetaria = GeneratedColumn<bool>(
      'cafetaria', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("cafetaria" IN (0, 1))'));
  static const VerificationMeta _interiorMeta =
      const VerificationMeta('interior');
  @override
  late final GeneratedColumn<bool> interior = GeneratedColumn<bool>(
      'interior', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("interior" IN (0, 1))'));
  static const VerificationMeta _exteriorMeta =
      const VerificationMeta('exterior');
  @override
  late final GeneratedColumn<bool> exterior = GeneratedColumn<bool>(
      'exterior', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("exterior" IN (0, 1))'));
  static const VerificationMeta _ativoMeta = const VerificationMeta('ativo');
  @override
  late final GeneratedColumn<bool> ativo = GeneratedColumn<bool>(
      'ativo', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("ativo" IN (0, 1))'));
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
        nome,
        descricao,
        categoria,
        idadeMin,
        idadeMax,
        precoMin,
        precoMax,
        latitude,
        longitude,
        morada,
        codigoPostal,
        cidade,
        distrito,
        telefone,
        website,
        email,
        horarioAbertura,
        horarioFecho,
        acessibilidade,
        estacionamento,
        wc,
        cafetaria,
        interior,
        exterior,
        ativo,
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
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    }
    if (data.containsKey('categoria')) {
      context.handle(_categoriaMeta,
          categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta));
    } else if (isInserting) {
      context.missing(_categoriaMeta);
    }
    if (data.containsKey('idade_min')) {
      context.handle(_idadeMinMeta,
          idadeMin.isAcceptableOrUnknown(data['idade_min']!, _idadeMinMeta));
    } else if (isInserting) {
      context.missing(_idadeMinMeta);
    }
    if (data.containsKey('idade_max')) {
      context.handle(_idadeMaxMeta,
          idadeMax.isAcceptableOrUnknown(data['idade_max']!, _idadeMaxMeta));
    } else if (isInserting) {
      context.missing(_idadeMaxMeta);
    }
    if (data.containsKey('preco_min')) {
      context.handle(_precoMinMeta,
          precoMin.isAcceptableOrUnknown(data['preco_min']!, _precoMinMeta));
    } else if (isInserting) {
      context.missing(_precoMinMeta);
    }
    if (data.containsKey('preco_max')) {
      context.handle(_precoMaxMeta,
          precoMax.isAcceptableOrUnknown(data['preco_max']!, _precoMaxMeta));
    } else if (isInserting) {
      context.missing(_precoMaxMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('morada')) {
      context.handle(_moradaMeta,
          morada.isAcceptableOrUnknown(data['morada']!, _moradaMeta));
    }
    if (data.containsKey('codigo_postal')) {
      context.handle(
          _codigoPostalMeta,
          codigoPostal.isAcceptableOrUnknown(
              data['codigo_postal']!, _codigoPostalMeta));
    }
    if (data.containsKey('cidade')) {
      context.handle(_cidadeMeta,
          cidade.isAcceptableOrUnknown(data['cidade']!, _cidadeMeta));
    }
    if (data.containsKey('distrito')) {
      context.handle(_distritoMeta,
          distrito.isAcceptableOrUnknown(data['distrito']!, _distritoMeta));
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('horario_abertura')) {
      context.handle(
          _horarioAberturaMeta,
          horarioAbertura.isAcceptableOrUnknown(
              data['horario_abertura']!, _horarioAberturaMeta));
    }
    if (data.containsKey('horario_fecho')) {
      context.handle(
          _horarioFechoMeta,
          horarioFecho.isAcceptableOrUnknown(
              data['horario_fecho']!, _horarioFechoMeta));
    }
    if (data.containsKey('acessibilidade')) {
      context.handle(
          _acessibilidadeMeta,
          acessibilidade.isAcceptableOrUnknown(
              data['acessibilidade']!, _acessibilidadeMeta));
    } else if (isInserting) {
      context.missing(_acessibilidadeMeta);
    }
    if (data.containsKey('estacionamento')) {
      context.handle(
          _estacionamentoMeta,
          estacionamento.isAcceptableOrUnknown(
              data['estacionamento']!, _estacionamentoMeta));
    } else if (isInserting) {
      context.missing(_estacionamentoMeta);
    }
    if (data.containsKey('wc')) {
      context.handle(_wcMeta, wc.isAcceptableOrUnknown(data['wc']!, _wcMeta));
    } else if (isInserting) {
      context.missing(_wcMeta);
    }
    if (data.containsKey('cafetaria')) {
      context.handle(_cafetariaMeta,
          cafetaria.isAcceptableOrUnknown(data['cafetaria']!, _cafetariaMeta));
    } else if (isInserting) {
      context.missing(_cafetariaMeta);
    }
    if (data.containsKey('interior')) {
      context.handle(_interiorMeta,
          interior.isAcceptableOrUnknown(data['interior']!, _interiorMeta));
    } else if (isInserting) {
      context.missing(_interiorMeta);
    }
    if (data.containsKey('exterior')) {
      context.handle(_exteriorMeta,
          exterior.isAcceptableOrUnknown(data['exterior']!, _exteriorMeta));
    } else if (isInserting) {
      context.missing(_exteriorMeta);
    }
    if (data.containsKey('ativo')) {
      context.handle(
          _ativoMeta, ativo.isAcceptableOrUnknown(data['ativo']!, _ativoMeta));
    } else if (isInserting) {
      context.missing(_ativoMeta);
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
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      descricao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descricao']),
      categoria: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categoria'])!,
      idadeMin: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idade_min'])!,
      idadeMax: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idade_max'])!,
      precoMin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}preco_min'])!,
      precoMax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}preco_max'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      morada: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}morada']),
      codigoPostal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}codigo_postal']),
      cidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cidade']),
      distrito: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}distrito']),
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone']),
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      horarioAbertura: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}horario_abertura']),
      horarioFecho: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}horario_fecho']),
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
      ativo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ativo'])!,
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
  final String nome;
  final String? descricao;
  final String categoria;
  final int idadeMin;
  final int idadeMax;
  final double precoMin;
  final double precoMax;
  final double latitude;
  final double longitude;
  final String? morada;
  final String? codigoPostal;
  final String? cidade;
  final String? distrito;
  final String? telefone;
  final String? website;
  final String? email;
  final String? horarioAbertura;
  final String? horarioFecho;
  final bool acessibilidade;
  final bool estacionamento;
  final bool wc;
  final bool cafetaria;
  final bool interior;
  final bool exterior;
  final bool ativo;
  final DateTime createdAt;
  const Favorite(
      {required this.id,
      required this.poiId,
      required this.nome,
      this.descricao,
      required this.categoria,
      required this.idadeMin,
      required this.idadeMax,
      required this.precoMin,
      required this.precoMax,
      required this.latitude,
      required this.longitude,
      this.morada,
      this.codigoPostal,
      this.cidade,
      this.distrito,
      this.telefone,
      this.website,
      this.email,
      this.horarioAbertura,
      this.horarioFecho,
      required this.acessibilidade,
      required this.estacionamento,
      required this.wc,
      required this.cafetaria,
      required this.interior,
      required this.exterior,
      required this.ativo,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['poi_id'] = Variable<int>(poiId);
    map['nome'] = Variable<String>(nome);
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    map['categoria'] = Variable<String>(categoria);
    map['idade_min'] = Variable<int>(idadeMin);
    map['idade_max'] = Variable<int>(idadeMax);
    map['preco_min'] = Variable<double>(precoMin);
    map['preco_max'] = Variable<double>(precoMax);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || morada != null) {
      map['morada'] = Variable<String>(morada);
    }
    if (!nullToAbsent || codigoPostal != null) {
      map['codigo_postal'] = Variable<String>(codigoPostal);
    }
    if (!nullToAbsent || cidade != null) {
      map['cidade'] = Variable<String>(cidade);
    }
    if (!nullToAbsent || distrito != null) {
      map['distrito'] = Variable<String>(distrito);
    }
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String>(telefone);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || horarioAbertura != null) {
      map['horario_abertura'] = Variable<String>(horarioAbertura);
    }
    if (!nullToAbsent || horarioFecho != null) {
      map['horario_fecho'] = Variable<String>(horarioFecho);
    }
    map['acessibilidade'] = Variable<bool>(acessibilidade);
    map['estacionamento'] = Variable<bool>(estacionamento);
    map['wc'] = Variable<bool>(wc);
    map['cafetaria'] = Variable<bool>(cafetaria);
    map['interior'] = Variable<bool>(interior);
    map['exterior'] = Variable<bool>(exterior);
    map['ativo'] = Variable<bool>(ativo);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      poiId: Value(poiId),
      nome: Value(nome),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      categoria: Value(categoria),
      idadeMin: Value(idadeMin),
      idadeMax: Value(idadeMax),
      precoMin: Value(precoMin),
      precoMax: Value(precoMax),
      latitude: Value(latitude),
      longitude: Value(longitude),
      morada:
          morada == null && nullToAbsent ? const Value.absent() : Value(morada),
      codigoPostal: codigoPostal == null && nullToAbsent
          ? const Value.absent()
          : Value(codigoPostal),
      cidade:
          cidade == null && nullToAbsent ? const Value.absent() : Value(cidade),
      distrito: distrito == null && nullToAbsent
          ? const Value.absent()
          : Value(distrito),
      telefone: telefone == null && nullToAbsent
          ? const Value.absent()
          : Value(telefone),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      horarioAbertura: horarioAbertura == null && nullToAbsent
          ? const Value.absent()
          : Value(horarioAbertura),
      horarioFecho: horarioFecho == null && nullToAbsent
          ? const Value.absent()
          : Value(horarioFecho),
      acessibilidade: Value(acessibilidade),
      estacionamento: Value(estacionamento),
      wc: Value(wc),
      cafetaria: Value(cafetaria),
      interior: Value(interior),
      exterior: Value(exterior),
      ativo: Value(ativo),
      createdAt: Value(createdAt),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      poiId: serializer.fromJson<int>(json['poiId']),
      nome: serializer.fromJson<String>(json['nome']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      categoria: serializer.fromJson<String>(json['categoria']),
      idadeMin: serializer.fromJson<int>(json['idadeMin']),
      idadeMax: serializer.fromJson<int>(json['idadeMax']),
      precoMin: serializer.fromJson<double>(json['precoMin']),
      precoMax: serializer.fromJson<double>(json['precoMax']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      morada: serializer.fromJson<String?>(json['morada']),
      codigoPostal: serializer.fromJson<String?>(json['codigoPostal']),
      cidade: serializer.fromJson<String?>(json['cidade']),
      distrito: serializer.fromJson<String?>(json['distrito']),
      telefone: serializer.fromJson<String?>(json['telefone']),
      website: serializer.fromJson<String?>(json['website']),
      email: serializer.fromJson<String?>(json['email']),
      horarioAbertura: serializer.fromJson<String?>(json['horarioAbertura']),
      horarioFecho: serializer.fromJson<String?>(json['horarioFecho']),
      acessibilidade: serializer.fromJson<bool>(json['acessibilidade']),
      estacionamento: serializer.fromJson<bool>(json['estacionamento']),
      wc: serializer.fromJson<bool>(json['wc']),
      cafetaria: serializer.fromJson<bool>(json['cafetaria']),
      interior: serializer.fromJson<bool>(json['interior']),
      exterior: serializer.fromJson<bool>(json['exterior']),
      ativo: serializer.fromJson<bool>(json['ativo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'poiId': serializer.toJson<int>(poiId),
      'nome': serializer.toJson<String>(nome),
      'descricao': serializer.toJson<String?>(descricao),
      'categoria': serializer.toJson<String>(categoria),
      'idadeMin': serializer.toJson<int>(idadeMin),
      'idadeMax': serializer.toJson<int>(idadeMax),
      'precoMin': serializer.toJson<double>(precoMin),
      'precoMax': serializer.toJson<double>(precoMax),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'morada': serializer.toJson<String?>(morada),
      'codigoPostal': serializer.toJson<String?>(codigoPostal),
      'cidade': serializer.toJson<String?>(cidade),
      'distrito': serializer.toJson<String?>(distrito),
      'telefone': serializer.toJson<String?>(telefone),
      'website': serializer.toJson<String?>(website),
      'email': serializer.toJson<String?>(email),
      'horarioAbertura': serializer.toJson<String?>(horarioAbertura),
      'horarioFecho': serializer.toJson<String?>(horarioFecho),
      'acessibilidade': serializer.toJson<bool>(acessibilidade),
      'estacionamento': serializer.toJson<bool>(estacionamento),
      'wc': serializer.toJson<bool>(wc),
      'cafetaria': serializer.toJson<bool>(cafetaria),
      'interior': serializer.toJson<bool>(interior),
      'exterior': serializer.toJson<bool>(exterior),
      'ativo': serializer.toJson<bool>(ativo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Favorite copyWith(
          {int? id,
          int? poiId,
          String? nome,
          Value<String?> descricao = const Value.absent(),
          String? categoria,
          int? idadeMin,
          int? idadeMax,
          double? precoMin,
          double? precoMax,
          double? latitude,
          double? longitude,
          Value<String?> morada = const Value.absent(),
          Value<String?> codigoPostal = const Value.absent(),
          Value<String?> cidade = const Value.absent(),
          Value<String?> distrito = const Value.absent(),
          Value<String?> telefone = const Value.absent(),
          Value<String?> website = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> horarioAbertura = const Value.absent(),
          Value<String?> horarioFecho = const Value.absent(),
          bool? acessibilidade,
          bool? estacionamento,
          bool? wc,
          bool? cafetaria,
          bool? interior,
          bool? exterior,
          bool? ativo,
          DateTime? createdAt}) =>
      Favorite(
        id: id ?? this.id,
        poiId: poiId ?? this.poiId,
        nome: nome ?? this.nome,
        descricao: descricao.present ? descricao.value : this.descricao,
        categoria: categoria ?? this.categoria,
        idadeMin: idadeMin ?? this.idadeMin,
        idadeMax: idadeMax ?? this.idadeMax,
        precoMin: precoMin ?? this.precoMin,
        precoMax: precoMax ?? this.precoMax,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        morada: morada.present ? morada.value : this.morada,
        codigoPostal:
            codigoPostal.present ? codigoPostal.value : this.codigoPostal,
        cidade: cidade.present ? cidade.value : this.cidade,
        distrito: distrito.present ? distrito.value : this.distrito,
        telefone: telefone.present ? telefone.value : this.telefone,
        website: website.present ? website.value : this.website,
        email: email.present ? email.value : this.email,
        horarioAbertura: horarioAbertura.present
            ? horarioAbertura.value
            : this.horarioAbertura,
        horarioFecho:
            horarioFecho.present ? horarioFecho.value : this.horarioFecho,
        acessibilidade: acessibilidade ?? this.acessibilidade,
        estacionamento: estacionamento ?? this.estacionamento,
        wc: wc ?? this.wc,
        cafetaria: cafetaria ?? this.cafetaria,
        interior: interior ?? this.interior,
        exterior: exterior ?? this.exterior,
        ativo: ativo ?? this.ativo,
        createdAt: createdAt ?? this.createdAt,
      );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      nome: data.nome.present ? data.nome.value : this.nome,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      idadeMin: data.idadeMin.present ? data.idadeMin.value : this.idadeMin,
      idadeMax: data.idadeMax.present ? data.idadeMax.value : this.idadeMax,
      precoMin: data.precoMin.present ? data.precoMin.value : this.precoMin,
      precoMax: data.precoMax.present ? data.precoMax.value : this.precoMax,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      morada: data.morada.present ? data.morada.value : this.morada,
      codigoPostal: data.codigoPostal.present
          ? data.codigoPostal.value
          : this.codigoPostal,
      cidade: data.cidade.present ? data.cidade.value : this.cidade,
      distrito: data.distrito.present ? data.distrito.value : this.distrito,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      website: data.website.present ? data.website.value : this.website,
      email: data.email.present ? data.email.value : this.email,
      horarioAbertura: data.horarioAbertura.present
          ? data.horarioAbertura.value
          : this.horarioAbertura,
      horarioFecho: data.horarioFecho.present
          ? data.horarioFecho.value
          : this.horarioFecho,
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
      ativo: data.ativo.present ? data.ativo.value : this.ativo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('poiId: $poiId, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('categoria: $categoria, ')
          ..write('idadeMin: $idadeMin, ')
          ..write('idadeMax: $idadeMax, ')
          ..write('precoMin: $precoMin, ')
          ..write('precoMax: $precoMax, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('morada: $morada, ')
          ..write('codigoPostal: $codigoPostal, ')
          ..write('cidade: $cidade, ')
          ..write('distrito: $distrito, ')
          ..write('telefone: $telefone, ')
          ..write('website: $website, ')
          ..write('email: $email, ')
          ..write('horarioAbertura: $horarioAbertura, ')
          ..write('horarioFecho: $horarioFecho, ')
          ..write('acessibilidade: $acessibilidade, ')
          ..write('estacionamento: $estacionamento, ')
          ..write('wc: $wc, ')
          ..write('cafetaria: $cafetaria, ')
          ..write('interior: $interior, ')
          ..write('exterior: $exterior, ')
          ..write('ativo: $ativo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        poiId,
        nome,
        descricao,
        categoria,
        idadeMin,
        idadeMax,
        precoMin,
        precoMax,
        latitude,
        longitude,
        morada,
        codigoPostal,
        cidade,
        distrito,
        telefone,
        website,
        email,
        horarioAbertura,
        horarioFecho,
        acessibilidade,
        estacionamento,
        wc,
        cafetaria,
        interior,
        exterior,
        ativo,
        createdAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.poiId == this.poiId &&
          other.nome == this.nome &&
          other.descricao == this.descricao &&
          other.categoria == this.categoria &&
          other.idadeMin == this.idadeMin &&
          other.idadeMax == this.idadeMax &&
          other.precoMin == this.precoMin &&
          other.precoMax == this.precoMax &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.morada == this.morada &&
          other.codigoPostal == this.codigoPostal &&
          other.cidade == this.cidade &&
          other.distrito == this.distrito &&
          other.telefone == this.telefone &&
          other.website == this.website &&
          other.email == this.email &&
          other.horarioAbertura == this.horarioAbertura &&
          other.horarioFecho == this.horarioFecho &&
          other.acessibilidade == this.acessibilidade &&
          other.estacionamento == this.estacionamento &&
          other.wc == this.wc &&
          other.cafetaria == this.cafetaria &&
          other.interior == this.interior &&
          other.exterior == this.exterior &&
          other.ativo == this.ativo &&
          other.createdAt == this.createdAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> poiId;
  final Value<String> nome;
  final Value<String?> descricao;
  final Value<String> categoria;
  final Value<int> idadeMin;
  final Value<int> idadeMax;
  final Value<double> precoMin;
  final Value<double> precoMax;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> morada;
  final Value<String?> codigoPostal;
  final Value<String?> cidade;
  final Value<String?> distrito;
  final Value<String?> telefone;
  final Value<String?> website;
  final Value<String?> email;
  final Value<String?> horarioAbertura;
  final Value<String?> horarioFecho;
  final Value<bool> acessibilidade;
  final Value<bool> estacionamento;
  final Value<bool> wc;
  final Value<bool> cafetaria;
  final Value<bool> interior;
  final Value<bool> exterior;
  final Value<bool> ativo;
  final Value<DateTime> createdAt;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.poiId = const Value.absent(),
    this.nome = const Value.absent(),
    this.descricao = const Value.absent(),
    this.categoria = const Value.absent(),
    this.idadeMin = const Value.absent(),
    this.idadeMax = const Value.absent(),
    this.precoMin = const Value.absent(),
    this.precoMax = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.morada = const Value.absent(),
    this.codigoPostal = const Value.absent(),
    this.cidade = const Value.absent(),
    this.distrito = const Value.absent(),
    this.telefone = const Value.absent(),
    this.website = const Value.absent(),
    this.email = const Value.absent(),
    this.horarioAbertura = const Value.absent(),
    this.horarioFecho = const Value.absent(),
    this.acessibilidade = const Value.absent(),
    this.estacionamento = const Value.absent(),
    this.wc = const Value.absent(),
    this.cafetaria = const Value.absent(),
    this.interior = const Value.absent(),
    this.exterior = const Value.absent(),
    this.ativo = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int poiId,
    required String nome,
    this.descricao = const Value.absent(),
    required String categoria,
    required int idadeMin,
    required int idadeMax,
    required double precoMin,
    required double precoMax,
    required double latitude,
    required double longitude,
    this.morada = const Value.absent(),
    this.codigoPostal = const Value.absent(),
    this.cidade = const Value.absent(),
    this.distrito = const Value.absent(),
    this.telefone = const Value.absent(),
    this.website = const Value.absent(),
    this.email = const Value.absent(),
    this.horarioAbertura = const Value.absent(),
    this.horarioFecho = const Value.absent(),
    required bool acessibilidade,
    required bool estacionamento,
    required bool wc,
    required bool cafetaria,
    required bool interior,
    required bool exterior,
    required bool ativo,
    this.createdAt = const Value.absent(),
  })  : poiId = Value(poiId),
        nome = Value(nome),
        categoria = Value(categoria),
        idadeMin = Value(idadeMin),
        idadeMax = Value(idadeMax),
        precoMin = Value(precoMin),
        precoMax = Value(precoMax),
        latitude = Value(latitude),
        longitude = Value(longitude),
        acessibilidade = Value(acessibilidade),
        estacionamento = Value(estacionamento),
        wc = Value(wc),
        cafetaria = Value(cafetaria),
        interior = Value(interior),
        exterior = Value(exterior),
        ativo = Value(ativo);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? poiId,
    Expression<String>? nome,
    Expression<String>? descricao,
    Expression<String>? categoria,
    Expression<int>? idadeMin,
    Expression<int>? idadeMax,
    Expression<double>? precoMin,
    Expression<double>? precoMax,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? morada,
    Expression<String>? codigoPostal,
    Expression<String>? cidade,
    Expression<String>? distrito,
    Expression<String>? telefone,
    Expression<String>? website,
    Expression<String>? email,
    Expression<String>? horarioAbertura,
    Expression<String>? horarioFecho,
    Expression<bool>? acessibilidade,
    Expression<bool>? estacionamento,
    Expression<bool>? wc,
    Expression<bool>? cafetaria,
    Expression<bool>? interior,
    Expression<bool>? exterior,
    Expression<bool>? ativo,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (poiId != null) 'poi_id': poiId,
      if (nome != null) 'nome': nome,
      if (descricao != null) 'descricao': descricao,
      if (categoria != null) 'categoria': categoria,
      if (idadeMin != null) 'idade_min': idadeMin,
      if (idadeMax != null) 'idade_max': idadeMax,
      if (precoMin != null) 'preco_min': precoMin,
      if (precoMax != null) 'preco_max': precoMax,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (morada != null) 'morada': morada,
      if (codigoPostal != null) 'codigo_postal': codigoPostal,
      if (cidade != null) 'cidade': cidade,
      if (distrito != null) 'distrito': distrito,
      if (telefone != null) 'telefone': telefone,
      if (website != null) 'website': website,
      if (email != null) 'email': email,
      if (horarioAbertura != null) 'horario_abertura': horarioAbertura,
      if (horarioFecho != null) 'horario_fecho': horarioFecho,
      if (acessibilidade != null) 'acessibilidade': acessibilidade,
      if (estacionamento != null) 'estacionamento': estacionamento,
      if (wc != null) 'wc': wc,
      if (cafetaria != null) 'cafetaria': cafetaria,
      if (interior != null) 'interior': interior,
      if (exterior != null) 'exterior': exterior,
      if (ativo != null) 'ativo': ativo,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int>? id,
      Value<int>? poiId,
      Value<String>? nome,
      Value<String?>? descricao,
      Value<String>? categoria,
      Value<int>? idadeMin,
      Value<int>? idadeMax,
      Value<double>? precoMin,
      Value<double>? precoMax,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String?>? morada,
      Value<String?>? codigoPostal,
      Value<String?>? cidade,
      Value<String?>? distrito,
      Value<String?>? telefone,
      Value<String?>? website,
      Value<String?>? email,
      Value<String?>? horarioAbertura,
      Value<String?>? horarioFecho,
      Value<bool>? acessibilidade,
      Value<bool>? estacionamento,
      Value<bool>? wc,
      Value<bool>? cafetaria,
      Value<bool>? interior,
      Value<bool>? exterior,
      Value<bool>? ativo,
      Value<DateTime>? createdAt}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      poiId: poiId ?? this.poiId,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      idadeMin: idadeMin ?? this.idadeMin,
      idadeMax: idadeMax ?? this.idadeMax,
      precoMin: precoMin ?? this.precoMin,
      precoMax: precoMax ?? this.precoMax,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      morada: morada ?? this.morada,
      codigoPostal: codigoPostal ?? this.codigoPostal,
      cidade: cidade ?? this.cidade,
      distrito: distrito ?? this.distrito,
      telefone: telefone ?? this.telefone,
      website: website ?? this.website,
      email: email ?? this.email,
      horarioAbertura: horarioAbertura ?? this.horarioAbertura,
      horarioFecho: horarioFecho ?? this.horarioFecho,
      acessibilidade: acessibilidade ?? this.acessibilidade,
      estacionamento: estacionamento ?? this.estacionamento,
      wc: wc ?? this.wc,
      cafetaria: cafetaria ?? this.cafetaria,
      interior: interior ?? this.interior,
      exterior: exterior ?? this.exterior,
      ativo: ativo ?? this.ativo,
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
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
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
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (morada.present) {
      map['morada'] = Variable<String>(morada.value);
    }
    if (codigoPostal.present) {
      map['codigo_postal'] = Variable<String>(codigoPostal.value);
    }
    if (cidade.present) {
      map['cidade'] = Variable<String>(cidade.value);
    }
    if (distrito.present) {
      map['distrito'] = Variable<String>(distrito.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (horarioAbertura.present) {
      map['horario_abertura'] = Variable<String>(horarioAbertura.value);
    }
    if (horarioFecho.present) {
      map['horario_fecho'] = Variable<String>(horarioFecho.value);
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
    if (ativo.present) {
      map['ativo'] = Variable<bool>(ativo.value);
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
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('categoria: $categoria, ')
          ..write('idadeMin: $idadeMin, ')
          ..write('idadeMax: $idadeMax, ')
          ..write('precoMin: $precoMin, ')
          ..write('precoMax: $precoMax, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('morada: $morada, ')
          ..write('codigoPostal: $codigoPostal, ')
          ..write('cidade: $cidade, ')
          ..write('distrito: $distrito, ')
          ..write('telefone: $telefone, ')
          ..write('website: $website, ')
          ..write('email: $email, ')
          ..write('horarioAbertura: $horarioAbertura, ')
          ..write('horarioFecho: $horarioFecho, ')
          ..write('acessibilidade: $acessibilidade, ')
          ..write('estacionamento: $estacionamento, ')
          ..write('wc: $wc, ')
          ..write('cafetaria: $cafetaria, ')
          ..write('interior: $interior, ')
          ..write('exterior: $exterior, ')
          ..write('ativo: $ativo, ')
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

class $ClickHistoryTable extends ClickHistory
    with TableInfo<$ClickHistoryTable, ClickHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClickHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _poiIdMeta = const VerificationMeta('poiId');
  @override
  late final GeneratedColumn<int> poiId = GeneratedColumn<int>(
      'poi_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _clickedAtMeta =
      const VerificationMeta('clickedAt');
  @override
  late final GeneratedColumn<DateTime> clickedAt = GeneratedColumn<DateTime>(
      'clicked_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [poiId, clickedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'click_history';
  @override
  VerificationContext validateIntegrity(Insertable<ClickHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('poi_id')) {
      context.handle(
          _poiIdMeta, poiId.isAcceptableOrUnknown(data['poi_id']!, _poiIdMeta));
    } else if (isInserting) {
      context.missing(_poiIdMeta);
    }
    if (data.containsKey('clicked_at')) {
      context.handle(_clickedAtMeta,
          clickedAt.isAcceptableOrUnknown(data['clicked_at']!, _clickedAtMeta));
    } else if (isInserting) {
      context.missing(_clickedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {poiId, clickedAt};
  @override
  ClickHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClickHistoryEntry(
      poiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}poi_id'])!,
      clickedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}clicked_at'])!,
    );
  }

  @override
  $ClickHistoryTable createAlias(String alias) {
    return $ClickHistoryTable(attachedDatabase, alias);
  }
}

class ClickHistoryEntry extends DataClass
    implements Insertable<ClickHistoryEntry> {
  final int poiId;
  final DateTime clickedAt;
  const ClickHistoryEntry({required this.poiId, required this.clickedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['poi_id'] = Variable<int>(poiId);
    map['clicked_at'] = Variable<DateTime>(clickedAt);
    return map;
  }

  ClickHistoryCompanion toCompanion(bool nullToAbsent) {
    return ClickHistoryCompanion(
      poiId: Value(poiId),
      clickedAt: Value(clickedAt),
    );
  }

  factory ClickHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClickHistoryEntry(
      poiId: serializer.fromJson<int>(json['poiId']),
      clickedAt: serializer.fromJson<DateTime>(json['clickedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'poiId': serializer.toJson<int>(poiId),
      'clickedAt': serializer.toJson<DateTime>(clickedAt),
    };
  }

  ClickHistoryEntry copyWith({int? poiId, DateTime? clickedAt}) =>
      ClickHistoryEntry(
        poiId: poiId ?? this.poiId,
        clickedAt: clickedAt ?? this.clickedAt,
      );
  ClickHistoryEntry copyWithCompanion(ClickHistoryCompanion data) {
    return ClickHistoryEntry(
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      clickedAt: data.clickedAt.present ? data.clickedAt.value : this.clickedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClickHistoryEntry(')
          ..write('poiId: $poiId, ')
          ..write('clickedAt: $clickedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(poiId, clickedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClickHistoryEntry &&
          other.poiId == this.poiId &&
          other.clickedAt == this.clickedAt);
}

class ClickHistoryCompanion extends UpdateCompanion<ClickHistoryEntry> {
  final Value<int> poiId;
  final Value<DateTime> clickedAt;
  final Value<int> rowid;
  const ClickHistoryCompanion({
    this.poiId = const Value.absent(),
    this.clickedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClickHistoryCompanion.insert({
    required int poiId,
    required DateTime clickedAt,
    this.rowid = const Value.absent(),
  })  : poiId = Value(poiId),
        clickedAt = Value(clickedAt);
  static Insertable<ClickHistoryEntry> custom({
    Expression<int>? poiId,
    Expression<DateTime>? clickedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (poiId != null) 'poi_id': poiId,
      if (clickedAt != null) 'clicked_at': clickedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClickHistoryCompanion copyWith(
      {Value<int>? poiId, Value<DateTime>? clickedAt, Value<int>? rowid}) {
    return ClickHistoryCompanion(
      poiId: poiId ?? this.poiId,
      clickedAt: clickedAt ?? this.clickedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (poiId.present) {
      map['poi_id'] = Variable<int>(poiId.value);
    }
    if (clickedAt.present) {
      map['clicked_at'] = Variable<DateTime>(clickedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClickHistoryCompanion(')
          ..write('poiId: $poiId, ')
          ..write('clickedAt: $clickedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedPoisTable extends CachedPois
    with TableInfo<$CachedPoisTable, CachedPoiEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPoisTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descricaoMeta =
      const VerificationMeta('descricao');
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
      'descricao', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoriaMeta =
      const VerificationMeta('categoria');
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
      'categoria', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subcategoriaMeta =
      const VerificationMeta('subcategoria');
  @override
  late final GeneratedColumn<String> subcategoria = GeneratedColumn<String>(
      'subcategoria', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _moradaMeta = const VerificationMeta('morada');
  @override
  late final GeneratedColumn<String> morada = GeneratedColumn<String>(
      'morada', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cidadeMeta = const VerificationMeta('cidade');
  @override
  late final GeneratedColumn<String> cidade = GeneratedColumn<String>(
      'cidade', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codPostalMeta =
      const VerificationMeta('codPostal');
  @override
  late final GeneratedColumn<String> codPostal = GeneratedColumn<String>(
      'cod_postal', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paisMeta = const VerificationMeta('pais');
  @override
  late final GeneratedColumn<String> pais = GeneratedColumn<String>(
      'pais', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idadeMinMeta =
      const VerificationMeta('idadeMin');
  @override
  late final GeneratedColumn<int> idadeMin = GeneratedColumn<int>(
      'idade_min', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _idadeMaxMeta =
      const VerificationMeta('idadeMax');
  @override
  late final GeneratedColumn<int> idadeMax = GeneratedColumn<int>(
      'idade_max', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _precoMeta = const VerificationMeta('preco');
  @override
  late final GeneratedColumn<double> preco = GeneratedColumn<double>(
      'preco', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isGratuitoMeta =
      const VerificationMeta('isGratuito');
  @override
  late final GeneratedColumn<bool> isGratuito = GeneratedColumn<bool>(
      'is_gratuito', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_gratuito" IN (0, 1))'));
  static const VerificationMeta _isAcessivelMeta =
      const VerificationMeta('isAcessivel');
  @override
  late final GeneratedColumn<bool> isAcessivel = GeneratedColumn<bool>(
      'is_acessivel', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_acessivel" IN (0, 1))'));
  static const VerificationMeta _duracaoMeta =
      const VerificationMeta('duracao');
  @override
  late final GeneratedColumn<int> duracao = GeneratedColumn<int>(
      'duracao', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _horarioMeta =
      const VerificationMeta('horario');
  @override
  late final GeneratedColumn<String> horario = GeneratedColumn<String>(
      'horario', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        descricao,
        categoria,
        subcategoria,
        latitude,
        longitude,
        morada,
        cidade,
        codPostal,
        pais,
        telefone,
        email,
        website,
        idadeMin,
        idadeMax,
        preco,
        isGratuito,
        isAcessivel,
        duracao,
        horario,
        tags,
        updatedAt,
        cachedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_pois';
  @override
  VerificationContext validateIntegrity(Insertable<CachedPoiEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    }
    if (data.containsKey('categoria')) {
      context.handle(_categoriaMeta,
          categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta));
    } else if (isInserting) {
      context.missing(_categoriaMeta);
    }
    if (data.containsKey('subcategoria')) {
      context.handle(
          _subcategoriaMeta,
          subcategoria.isAcceptableOrUnknown(
              data['subcategoria']!, _subcategoriaMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('morada')) {
      context.handle(_moradaMeta,
          morada.isAcceptableOrUnknown(data['morada']!, _moradaMeta));
    }
    if (data.containsKey('cidade')) {
      context.handle(_cidadeMeta,
          cidade.isAcceptableOrUnknown(data['cidade']!, _cidadeMeta));
    }
    if (data.containsKey('cod_postal')) {
      context.handle(_codPostalMeta,
          codPostal.isAcceptableOrUnknown(data['cod_postal']!, _codPostalMeta));
    }
    if (data.containsKey('pais')) {
      context.handle(
          _paisMeta, pais.isAcceptableOrUnknown(data['pais']!, _paisMeta));
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('idade_min')) {
      context.handle(_idadeMinMeta,
          idadeMin.isAcceptableOrUnknown(data['idade_min']!, _idadeMinMeta));
    }
    if (data.containsKey('idade_max')) {
      context.handle(_idadeMaxMeta,
          idadeMax.isAcceptableOrUnknown(data['idade_max']!, _idadeMaxMeta));
    }
    if (data.containsKey('preco')) {
      context.handle(
          _precoMeta, preco.isAcceptableOrUnknown(data['preco']!, _precoMeta));
    }
    if (data.containsKey('is_gratuito')) {
      context.handle(
          _isGratuitoMeta,
          isGratuito.isAcceptableOrUnknown(
              data['is_gratuito']!, _isGratuitoMeta));
    }
    if (data.containsKey('is_acessivel')) {
      context.handle(
          _isAcessivelMeta,
          isAcessivel.isAcceptableOrUnknown(
              data['is_acessivel']!, _isAcessivelMeta));
    }
    if (data.containsKey('duracao')) {
      context.handle(_duracaoMeta,
          duracao.isAcceptableOrUnknown(data['duracao']!, _duracaoMeta));
    }
    if (data.containsKey('horario')) {
      context.handle(_horarioMeta,
          horario.isAcceptableOrUnknown(data['horario']!, _horarioMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedPoiEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedPoiEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      descricao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descricao']),
      categoria: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categoria'])!,
      subcategoria: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subcategoria']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      morada: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}morada']),
      cidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cidade']),
      codPostal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cod_postal']),
      pais: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pais']),
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website']),
      idadeMin: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idade_min']),
      idadeMax: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idade_max']),
      preco: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}preco']),
      isGratuito: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_gratuito']),
      isAcessivel: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_acessivel']),
      duracao: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duracao']),
      horario: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}horario']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedPoisTable createAlias(String alias) {
    return $CachedPoisTable(attachedDatabase, alias);
  }
}

class CachedPoiEntry extends DataClass implements Insertable<CachedPoiEntry> {
  final int id;
  final String nome;
  final String? descricao;
  final String categoria;
  final String? subcategoria;
  final double? latitude;
  final double? longitude;
  final String? morada;
  final String? cidade;
  final String? codPostal;
  final String? pais;
  final String? telefone;
  final String? email;
  final String? website;
  final int? idadeMin;
  final int? idadeMax;
  final double? preco;
  final bool? isGratuito;
  final bool? isAcessivel;
  final int? duracao;
  final String? horario;
  final String? tags;
  final DateTime? updatedAt;
  final DateTime cachedAt;
  const CachedPoiEntry(
      {required this.id,
      required this.nome,
      this.descricao,
      required this.categoria,
      this.subcategoria,
      this.latitude,
      this.longitude,
      this.morada,
      this.cidade,
      this.codPostal,
      this.pais,
      this.telefone,
      this.email,
      this.website,
      this.idadeMin,
      this.idadeMax,
      this.preco,
      this.isGratuito,
      this.isAcessivel,
      this.duracao,
      this.horario,
      this.tags,
      this.updatedAt,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    map['categoria'] = Variable<String>(categoria);
    if (!nullToAbsent || subcategoria != null) {
      map['subcategoria'] = Variable<String>(subcategoria);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || morada != null) {
      map['morada'] = Variable<String>(morada);
    }
    if (!nullToAbsent || cidade != null) {
      map['cidade'] = Variable<String>(cidade);
    }
    if (!nullToAbsent || codPostal != null) {
      map['cod_postal'] = Variable<String>(codPostal);
    }
    if (!nullToAbsent || pais != null) {
      map['pais'] = Variable<String>(pais);
    }
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String>(telefone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || idadeMin != null) {
      map['idade_min'] = Variable<int>(idadeMin);
    }
    if (!nullToAbsent || idadeMax != null) {
      map['idade_max'] = Variable<int>(idadeMax);
    }
    if (!nullToAbsent || preco != null) {
      map['preco'] = Variable<double>(preco);
    }
    if (!nullToAbsent || isGratuito != null) {
      map['is_gratuito'] = Variable<bool>(isGratuito);
    }
    if (!nullToAbsent || isAcessivel != null) {
      map['is_acessivel'] = Variable<bool>(isAcessivel);
    }
    if (!nullToAbsent || duracao != null) {
      map['duracao'] = Variable<int>(duracao);
    }
    if (!nullToAbsent || horario != null) {
      map['horario'] = Variable<String>(horario);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedPoisCompanion toCompanion(bool nullToAbsent) {
    return CachedPoisCompanion(
      id: Value(id),
      nome: Value(nome),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      categoria: Value(categoria),
      subcategoria: subcategoria == null && nullToAbsent
          ? const Value.absent()
          : Value(subcategoria),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      morada:
          morada == null && nullToAbsent ? const Value.absent() : Value(morada),
      cidade:
          cidade == null && nullToAbsent ? const Value.absent() : Value(cidade),
      codPostal: codPostal == null && nullToAbsent
          ? const Value.absent()
          : Value(codPostal),
      pais: pais == null && nullToAbsent ? const Value.absent() : Value(pais),
      telefone: telefone == null && nullToAbsent
          ? const Value.absent()
          : Value(telefone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      idadeMin: idadeMin == null && nullToAbsent
          ? const Value.absent()
          : Value(idadeMin),
      idadeMax: idadeMax == null && nullToAbsent
          ? const Value.absent()
          : Value(idadeMax),
      preco:
          preco == null && nullToAbsent ? const Value.absent() : Value(preco),
      isGratuito: isGratuito == null && nullToAbsent
          ? const Value.absent()
          : Value(isGratuito),
      isAcessivel: isAcessivel == null && nullToAbsent
          ? const Value.absent()
          : Value(isAcessivel),
      duracao: duracao == null && nullToAbsent
          ? const Value.absent()
          : Value(duracao),
      horario: horario == null && nullToAbsent
          ? const Value.absent()
          : Value(horario),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedPoiEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPoiEntry(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      categoria: serializer.fromJson<String>(json['categoria']),
      subcategoria: serializer.fromJson<String?>(json['subcategoria']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      morada: serializer.fromJson<String?>(json['morada']),
      cidade: serializer.fromJson<String?>(json['cidade']),
      codPostal: serializer.fromJson<String?>(json['codPostal']),
      pais: serializer.fromJson<String?>(json['pais']),
      telefone: serializer.fromJson<String?>(json['telefone']),
      email: serializer.fromJson<String?>(json['email']),
      website: serializer.fromJson<String?>(json['website']),
      idadeMin: serializer.fromJson<int?>(json['idadeMin']),
      idadeMax: serializer.fromJson<int?>(json['idadeMax']),
      preco: serializer.fromJson<double?>(json['preco']),
      isGratuito: serializer.fromJson<bool?>(json['isGratuito']),
      isAcessivel: serializer.fromJson<bool?>(json['isAcessivel']),
      duracao: serializer.fromJson<int?>(json['duracao']),
      horario: serializer.fromJson<String?>(json['horario']),
      tags: serializer.fromJson<String?>(json['tags']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'descricao': serializer.toJson<String?>(descricao),
      'categoria': serializer.toJson<String>(categoria),
      'subcategoria': serializer.toJson<String?>(subcategoria),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'morada': serializer.toJson<String?>(morada),
      'cidade': serializer.toJson<String?>(cidade),
      'codPostal': serializer.toJson<String?>(codPostal),
      'pais': serializer.toJson<String?>(pais),
      'telefone': serializer.toJson<String?>(telefone),
      'email': serializer.toJson<String?>(email),
      'website': serializer.toJson<String?>(website),
      'idadeMin': serializer.toJson<int?>(idadeMin),
      'idadeMax': serializer.toJson<int?>(idadeMax),
      'preco': serializer.toJson<double?>(preco),
      'isGratuito': serializer.toJson<bool?>(isGratuito),
      'isAcessivel': serializer.toJson<bool?>(isAcessivel),
      'duracao': serializer.toJson<int?>(duracao),
      'horario': serializer.toJson<String?>(horario),
      'tags': serializer.toJson<String?>(tags),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedPoiEntry copyWith(
          {int? id,
          String? nome,
          Value<String?> descricao = const Value.absent(),
          String? categoria,
          Value<String?> subcategoria = const Value.absent(),
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent(),
          Value<String?> morada = const Value.absent(),
          Value<String?> cidade = const Value.absent(),
          Value<String?> codPostal = const Value.absent(),
          Value<String?> pais = const Value.absent(),
          Value<String?> telefone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> website = const Value.absent(),
          Value<int?> idadeMin = const Value.absent(),
          Value<int?> idadeMax = const Value.absent(),
          Value<double?> preco = const Value.absent(),
          Value<bool?> isGratuito = const Value.absent(),
          Value<bool?> isAcessivel = const Value.absent(),
          Value<int?> duracao = const Value.absent(),
          Value<String?> horario = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          DateTime? cachedAt}) =>
      CachedPoiEntry(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao.present ? descricao.value : this.descricao,
        categoria: categoria ?? this.categoria,
        subcategoria:
            subcategoria.present ? subcategoria.value : this.subcategoria,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
        morada: morada.present ? morada.value : this.morada,
        cidade: cidade.present ? cidade.value : this.cidade,
        codPostal: codPostal.present ? codPostal.value : this.codPostal,
        pais: pais.present ? pais.value : this.pais,
        telefone: telefone.present ? telefone.value : this.telefone,
        email: email.present ? email.value : this.email,
        website: website.present ? website.value : this.website,
        idadeMin: idadeMin.present ? idadeMin.value : this.idadeMin,
        idadeMax: idadeMax.present ? idadeMax.value : this.idadeMax,
        preco: preco.present ? preco.value : this.preco,
        isGratuito: isGratuito.present ? isGratuito.value : this.isGratuito,
        isAcessivel: isAcessivel.present ? isAcessivel.value : this.isAcessivel,
        duracao: duracao.present ? duracao.value : this.duracao,
        horario: horario.present ? horario.value : this.horario,
        tags: tags.present ? tags.value : this.tags,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedPoiEntry copyWithCompanion(CachedPoisCompanion data) {
    return CachedPoiEntry(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      subcategoria: data.subcategoria.present
          ? data.subcategoria.value
          : this.subcategoria,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      morada: data.morada.present ? data.morada.value : this.morada,
      cidade: data.cidade.present ? data.cidade.value : this.cidade,
      codPostal: data.codPostal.present ? data.codPostal.value : this.codPostal,
      pais: data.pais.present ? data.pais.value : this.pais,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      email: data.email.present ? data.email.value : this.email,
      website: data.website.present ? data.website.value : this.website,
      idadeMin: data.idadeMin.present ? data.idadeMin.value : this.idadeMin,
      idadeMax: data.idadeMax.present ? data.idadeMax.value : this.idadeMax,
      preco: data.preco.present ? data.preco.value : this.preco,
      isGratuito:
          data.isGratuito.present ? data.isGratuito.value : this.isGratuito,
      isAcessivel:
          data.isAcessivel.present ? data.isAcessivel.value : this.isAcessivel,
      duracao: data.duracao.present ? data.duracao.value : this.duracao,
      horario: data.horario.present ? data.horario.value : this.horario,
      tags: data.tags.present ? data.tags.value : this.tags,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedPoiEntry(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('categoria: $categoria, ')
          ..write('subcategoria: $subcategoria, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('morada: $morada, ')
          ..write('cidade: $cidade, ')
          ..write('codPostal: $codPostal, ')
          ..write('pais: $pais, ')
          ..write('telefone: $telefone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('idadeMin: $idadeMin, ')
          ..write('idadeMax: $idadeMax, ')
          ..write('preco: $preco, ')
          ..write('isGratuito: $isGratuito, ')
          ..write('isAcessivel: $isAcessivel, ')
          ..write('duracao: $duracao, ')
          ..write('horario: $horario, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        nome,
        descricao,
        categoria,
        subcategoria,
        latitude,
        longitude,
        morada,
        cidade,
        codPostal,
        pais,
        telefone,
        email,
        website,
        idadeMin,
        idadeMax,
        preco,
        isGratuito,
        isAcessivel,
        duracao,
        horario,
        tags,
        updatedAt,
        cachedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPoiEntry &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.descricao == this.descricao &&
          other.categoria == this.categoria &&
          other.subcategoria == this.subcategoria &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.morada == this.morada &&
          other.cidade == this.cidade &&
          other.codPostal == this.codPostal &&
          other.pais == this.pais &&
          other.telefone == this.telefone &&
          other.email == this.email &&
          other.website == this.website &&
          other.idadeMin == this.idadeMin &&
          other.idadeMax == this.idadeMax &&
          other.preco == this.preco &&
          other.isGratuito == this.isGratuito &&
          other.isAcessivel == this.isAcessivel &&
          other.duracao == this.duracao &&
          other.horario == this.horario &&
          other.tags == this.tags &&
          other.updatedAt == this.updatedAt &&
          other.cachedAt == this.cachedAt);
}

class CachedPoisCompanion extends UpdateCompanion<CachedPoiEntry> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String?> descricao;
  final Value<String> categoria;
  final Value<String?> subcategoria;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> morada;
  final Value<String?> cidade;
  final Value<String?> codPostal;
  final Value<String?> pais;
  final Value<String?> telefone;
  final Value<String?> email;
  final Value<String?> website;
  final Value<int?> idadeMin;
  final Value<int?> idadeMax;
  final Value<double?> preco;
  final Value<bool?> isGratuito;
  final Value<bool?> isAcessivel;
  final Value<int?> duracao;
  final Value<String?> horario;
  final Value<String?> tags;
  final Value<DateTime?> updatedAt;
  final Value<DateTime> cachedAt;
  const CachedPoisCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.descricao = const Value.absent(),
    this.categoria = const Value.absent(),
    this.subcategoria = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.morada = const Value.absent(),
    this.cidade = const Value.absent(),
    this.codPostal = const Value.absent(),
    this.pais = const Value.absent(),
    this.telefone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.idadeMin = const Value.absent(),
    this.idadeMax = const Value.absent(),
    this.preco = const Value.absent(),
    this.isGratuito = const Value.absent(),
    this.isAcessivel = const Value.absent(),
    this.duracao = const Value.absent(),
    this.horario = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CachedPoisCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    this.descricao = const Value.absent(),
    required String categoria,
    this.subcategoria = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.morada = const Value.absent(),
    this.cidade = const Value.absent(),
    this.codPostal = const Value.absent(),
    this.pais = const Value.absent(),
    this.telefone = const Value.absent(),
    this.email = const Value.absent(),
    this.website = const Value.absent(),
    this.idadeMin = const Value.absent(),
    this.idadeMax = const Value.absent(),
    this.preco = const Value.absent(),
    this.isGratuito = const Value.absent(),
    this.isAcessivel = const Value.absent(),
    this.duracao = const Value.absent(),
    this.horario = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime cachedAt,
  })  : nome = Value(nome),
        categoria = Value(categoria),
        cachedAt = Value(cachedAt);
  static Insertable<CachedPoiEntry> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? descricao,
    Expression<String>? categoria,
    Expression<String>? subcategoria,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? morada,
    Expression<String>? cidade,
    Expression<String>? codPostal,
    Expression<String>? pais,
    Expression<String>? telefone,
    Expression<String>? email,
    Expression<String>? website,
    Expression<int>? idadeMin,
    Expression<int>? idadeMax,
    Expression<double>? preco,
    Expression<bool>? isGratuito,
    Expression<bool>? isAcessivel,
    Expression<int>? duracao,
    Expression<String>? horario,
    Expression<String>? tags,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (descricao != null) 'descricao': descricao,
      if (categoria != null) 'categoria': categoria,
      if (subcategoria != null) 'subcategoria': subcategoria,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (morada != null) 'morada': morada,
      if (cidade != null) 'cidade': cidade,
      if (codPostal != null) 'cod_postal': codPostal,
      if (pais != null) 'pais': pais,
      if (telefone != null) 'telefone': telefone,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      if (idadeMin != null) 'idade_min': idadeMin,
      if (idadeMax != null) 'idade_max': idadeMax,
      if (preco != null) 'preco': preco,
      if (isGratuito != null) 'is_gratuito': isGratuito,
      if (isAcessivel != null) 'is_acessivel': isAcessivel,
      if (duracao != null) 'duracao': duracao,
      if (horario != null) 'horario': horario,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CachedPoisCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String?>? descricao,
      Value<String>? categoria,
      Value<String?>? subcategoria,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<String?>? morada,
      Value<String?>? cidade,
      Value<String?>? codPostal,
      Value<String?>? pais,
      Value<String?>? telefone,
      Value<String?>? email,
      Value<String?>? website,
      Value<int?>? idadeMin,
      Value<int?>? idadeMax,
      Value<double?>? preco,
      Value<bool?>? isGratuito,
      Value<bool?>? isAcessivel,
      Value<int?>? duracao,
      Value<String?>? horario,
      Value<String?>? tags,
      Value<DateTime?>? updatedAt,
      Value<DateTime>? cachedAt}) {
    return CachedPoisCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      subcategoria: subcategoria ?? this.subcategoria,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      morada: morada ?? this.morada,
      cidade: cidade ?? this.cidade,
      codPostal: codPostal ?? this.codPostal,
      pais: pais ?? this.pais,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      website: website ?? this.website,
      idadeMin: idadeMin ?? this.idadeMin,
      idadeMax: idadeMax ?? this.idadeMax,
      preco: preco ?? this.preco,
      isGratuito: isGratuito ?? this.isGratuito,
      isAcessivel: isAcessivel ?? this.isAcessivel,
      duracao: duracao ?? this.duracao,
      horario: horario ?? this.horario,
      tags: tags ?? this.tags,
      updatedAt: updatedAt ?? this.updatedAt,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (subcategoria.present) {
      map['subcategoria'] = Variable<String>(subcategoria.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (morada.present) {
      map['morada'] = Variable<String>(morada.value);
    }
    if (cidade.present) {
      map['cidade'] = Variable<String>(cidade.value);
    }
    if (codPostal.present) {
      map['cod_postal'] = Variable<String>(codPostal.value);
    }
    if (pais.present) {
      map['pais'] = Variable<String>(pais.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (idadeMin.present) {
      map['idade_min'] = Variable<int>(idadeMin.value);
    }
    if (idadeMax.present) {
      map['idade_max'] = Variable<int>(idadeMax.value);
    }
    if (preco.present) {
      map['preco'] = Variable<double>(preco.value);
    }
    if (isGratuito.present) {
      map['is_gratuito'] = Variable<bool>(isGratuito.value);
    }
    if (isAcessivel.present) {
      map['is_acessivel'] = Variable<bool>(isAcessivel.value);
    }
    if (duracao.present) {
      map['duracao'] = Variable<int>(duracao.value);
    }
    if (horario.present) {
      map['horario'] = Variable<String>(horario.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPoisCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('categoria: $categoria, ')
          ..write('subcategoria: $subcategoria, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('morada: $morada, ')
          ..write('cidade: $cidade, ')
          ..write('codPostal: $codPostal, ')
          ..write('pais: $pais, ')
          ..write('telefone: $telefone, ')
          ..write('email: $email, ')
          ..write('website: $website, ')
          ..write('idadeMin: $idadeMin, ')
          ..write('idadeMax: $idadeMax, ')
          ..write('preco: $preco, ')
          ..write('isGratuito: $isGratuito, ')
          ..write('isAcessivel: $isAcessivel, ')
          ..write('duracao: $duracao, ')
          ..write('horario: $horario, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final $ClickHistoryTable clickHistory = $ClickHistoryTable(this);
  late final $CachedPoisTable cachedPois = $CachedPoisTable(this);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  late final ReviewsDao reviewsDao = ReviewsDao(this as AppDatabase);
  late final ClickHistoryDao clickHistoryDao =
      ClickHistoryDao(this as AppDatabase);
  late final CachedPoisDao cachedPoisDao = CachedPoisDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [favorites, reviews, clickHistory, cachedPois];
}

typedef $$FavoritesTableCreateCompanionBuilder = FavoritesCompanion Function({
  Value<int> id,
  required int poiId,
  required String nome,
  Value<String?> descricao,
  required String categoria,
  required int idadeMin,
  required int idadeMax,
  required double precoMin,
  required double precoMax,
  required double latitude,
  required double longitude,
  Value<String?> morada,
  Value<String?> codigoPostal,
  Value<String?> cidade,
  Value<String?> distrito,
  Value<String?> telefone,
  Value<String?> website,
  Value<String?> email,
  Value<String?> horarioAbertura,
  Value<String?> horarioFecho,
  required bool acessibilidade,
  required bool estacionamento,
  required bool wc,
  required bool cafetaria,
  required bool interior,
  required bool exterior,
  required bool ativo,
  Value<DateTime> createdAt,
});
typedef $$FavoritesTableUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<int> id,
  Value<int> poiId,
  Value<String> nome,
  Value<String?> descricao,
  Value<String> categoria,
  Value<int> idadeMin,
  Value<int> idadeMax,
  Value<double> precoMin,
  Value<double> precoMax,
  Value<double> latitude,
  Value<double> longitude,
  Value<String?> morada,
  Value<String?> codigoPostal,
  Value<String?> cidade,
  Value<String?> distrito,
  Value<String?> telefone,
  Value<String?> website,
  Value<String?> email,
  Value<String?> horarioAbertura,
  Value<String?> horarioFecho,
  Value<bool> acessibilidade,
  Value<bool> estacionamento,
  Value<bool> wc,
  Value<bool> cafetaria,
  Value<bool> interior,
  Value<bool> exterior,
  Value<bool> ativo,
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

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoria => $composableBuilder(
      column: $table.categoria, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idadeMin => $composableBuilder(
      column: $table.idadeMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idadeMax => $composableBuilder(
      column: $table.idadeMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get precoMin => $composableBuilder(
      column: $table.precoMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get precoMax => $composableBuilder(
      column: $table.precoMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get morada => $composableBuilder(
      column: $table.morada, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codigoPostal => $composableBuilder(
      column: $table.codigoPostal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cidade => $composableBuilder(
      column: $table.cidade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get distrito => $composableBuilder(
      column: $table.distrito, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get horarioAbertura => $composableBuilder(
      column: $table.horarioAbertura,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get horarioFecho => $composableBuilder(
      column: $table.horarioFecho, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<bool> get ativo => $composableBuilder(
      column: $table.ativo, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoria => $composableBuilder(
      column: $table.categoria, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idadeMin => $composableBuilder(
      column: $table.idadeMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idadeMax => $composableBuilder(
      column: $table.idadeMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get precoMin => $composableBuilder(
      column: $table.precoMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get precoMax => $composableBuilder(
      column: $table.precoMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get morada => $composableBuilder(
      column: $table.morada, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codigoPostal => $composableBuilder(
      column: $table.codigoPostal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cidade => $composableBuilder(
      column: $table.cidade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get distrito => $composableBuilder(
      column: $table.distrito, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get horarioAbertura => $composableBuilder(
      column: $table.horarioAbertura,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get horarioFecho => $composableBuilder(
      column: $table.horarioFecho,
      builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<bool> get ativo => $composableBuilder(
      column: $table.ativo, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<int> get idadeMin =>
      $composableBuilder(column: $table.idadeMin, builder: (column) => column);

  GeneratedColumn<int> get idadeMax =>
      $composableBuilder(column: $table.idadeMax, builder: (column) => column);

  GeneratedColumn<double> get precoMin =>
      $composableBuilder(column: $table.precoMin, builder: (column) => column);

  GeneratedColumn<double> get precoMax =>
      $composableBuilder(column: $table.precoMax, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get morada =>
      $composableBuilder(column: $table.morada, builder: (column) => column);

  GeneratedColumn<String> get codigoPostal => $composableBuilder(
      column: $table.codigoPostal, builder: (column) => column);

  GeneratedColumn<String> get cidade =>
      $composableBuilder(column: $table.cidade, builder: (column) => column);

  GeneratedColumn<String> get distrito =>
      $composableBuilder(column: $table.distrito, builder: (column) => column);

  GeneratedColumn<String> get telefone =>
      $composableBuilder(column: $table.telefone, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get horarioAbertura => $composableBuilder(
      column: $table.horarioAbertura, builder: (column) => column);

  GeneratedColumn<String> get horarioFecho => $composableBuilder(
      column: $table.horarioFecho, builder: (column) => column);

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

  GeneratedColumn<bool> get ativo =>
      $composableBuilder(column: $table.ativo, builder: (column) => column);

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
            Value<String> nome = const Value.absent(),
            Value<String?> descricao = const Value.absent(),
            Value<String> categoria = const Value.absent(),
            Value<int> idadeMin = const Value.absent(),
            Value<int> idadeMax = const Value.absent(),
            Value<double> precoMin = const Value.absent(),
            Value<double> precoMax = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<String?> morada = const Value.absent(),
            Value<String?> codigoPostal = const Value.absent(),
            Value<String?> cidade = const Value.absent(),
            Value<String?> distrito = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> horarioAbertura = const Value.absent(),
            Value<String?> horarioFecho = const Value.absent(),
            Value<bool> acessibilidade = const Value.absent(),
            Value<bool> estacionamento = const Value.absent(),
            Value<bool> wc = const Value.absent(),
            Value<bool> cafetaria = const Value.absent(),
            Value<bool> interior = const Value.absent(),
            Value<bool> exterior = const Value.absent(),
            Value<bool> ativo = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesCompanion(
            id: id,
            poiId: poiId,
            nome: nome,
            descricao: descricao,
            categoria: categoria,
            idadeMin: idadeMin,
            idadeMax: idadeMax,
            precoMin: precoMin,
            precoMax: precoMax,
            latitude: latitude,
            longitude: longitude,
            morada: morada,
            codigoPostal: codigoPostal,
            cidade: cidade,
            distrito: distrito,
            telefone: telefone,
            website: website,
            email: email,
            horarioAbertura: horarioAbertura,
            horarioFecho: horarioFecho,
            acessibilidade: acessibilidade,
            estacionamento: estacionamento,
            wc: wc,
            cafetaria: cafetaria,
            interior: interior,
            exterior: exterior,
            ativo: ativo,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int poiId,
            required String nome,
            Value<String?> descricao = const Value.absent(),
            required String categoria,
            required int idadeMin,
            required int idadeMax,
            required double precoMin,
            required double precoMax,
            required double latitude,
            required double longitude,
            Value<String?> morada = const Value.absent(),
            Value<String?> codigoPostal = const Value.absent(),
            Value<String?> cidade = const Value.absent(),
            Value<String?> distrito = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> horarioAbertura = const Value.absent(),
            Value<String?> horarioFecho = const Value.absent(),
            required bool acessibilidade,
            required bool estacionamento,
            required bool wc,
            required bool cafetaria,
            required bool interior,
            required bool exterior,
            required bool ativo,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesCompanion.insert(
            id: id,
            poiId: poiId,
            nome: nome,
            descricao: descricao,
            categoria: categoria,
            idadeMin: idadeMin,
            idadeMax: idadeMax,
            precoMin: precoMin,
            precoMax: precoMax,
            latitude: latitude,
            longitude: longitude,
            morada: morada,
            codigoPostal: codigoPostal,
            cidade: cidade,
            distrito: distrito,
            telefone: telefone,
            website: website,
            email: email,
            horarioAbertura: horarioAbertura,
            horarioFecho: horarioFecho,
            acessibilidade: acessibilidade,
            estacionamento: estacionamento,
            wc: wc,
            cafetaria: cafetaria,
            interior: interior,
            exterior: exterior,
            ativo: ativo,
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
typedef $$ClickHistoryTableCreateCompanionBuilder = ClickHistoryCompanion
    Function({
  required int poiId,
  required DateTime clickedAt,
  Value<int> rowid,
});
typedef $$ClickHistoryTableUpdateCompanionBuilder = ClickHistoryCompanion
    Function({
  Value<int> poiId,
  Value<DateTime> clickedAt,
  Value<int> rowid,
});

class $$ClickHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $ClickHistoryTable> {
  $$ClickHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get poiId => $composableBuilder(
      column: $table.poiId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get clickedAt => $composableBuilder(
      column: $table.clickedAt, builder: (column) => ColumnFilters(column));
}

class $$ClickHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $ClickHistoryTable> {
  $$ClickHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get poiId => $composableBuilder(
      column: $table.poiId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get clickedAt => $composableBuilder(
      column: $table.clickedAt, builder: (column) => ColumnOrderings(column));
}

class $$ClickHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClickHistoryTable> {
  $$ClickHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get poiId =>
      $composableBuilder(column: $table.poiId, builder: (column) => column);

  GeneratedColumn<DateTime> get clickedAt =>
      $composableBuilder(column: $table.clickedAt, builder: (column) => column);
}

class $$ClickHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClickHistoryTable,
    ClickHistoryEntry,
    $$ClickHistoryTableFilterComposer,
    $$ClickHistoryTableOrderingComposer,
    $$ClickHistoryTableAnnotationComposer,
    $$ClickHistoryTableCreateCompanionBuilder,
    $$ClickHistoryTableUpdateCompanionBuilder,
    (
      ClickHistoryEntry,
      BaseReferences<_$AppDatabase, $ClickHistoryTable, ClickHistoryEntry>
    ),
    ClickHistoryEntry,
    PrefetchHooks Function()> {
  $$ClickHistoryTableTableManager(_$AppDatabase db, $ClickHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClickHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClickHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClickHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> poiId = const Value.absent(),
            Value<DateTime> clickedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClickHistoryCompanion(
            poiId: poiId,
            clickedAt: clickedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int poiId,
            required DateTime clickedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ClickHistoryCompanion.insert(
            poiId: poiId,
            clickedAt: clickedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClickHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClickHistoryTable,
    ClickHistoryEntry,
    $$ClickHistoryTableFilterComposer,
    $$ClickHistoryTableOrderingComposer,
    $$ClickHistoryTableAnnotationComposer,
    $$ClickHistoryTableCreateCompanionBuilder,
    $$ClickHistoryTableUpdateCompanionBuilder,
    (
      ClickHistoryEntry,
      BaseReferences<_$AppDatabase, $ClickHistoryTable, ClickHistoryEntry>
    ),
    ClickHistoryEntry,
    PrefetchHooks Function()>;
typedef $$CachedPoisTableCreateCompanionBuilder = CachedPoisCompanion Function({
  Value<int> id,
  required String nome,
  Value<String?> descricao,
  required String categoria,
  Value<String?> subcategoria,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String?> morada,
  Value<String?> cidade,
  Value<String?> codPostal,
  Value<String?> pais,
  Value<String?> telefone,
  Value<String?> email,
  Value<String?> website,
  Value<int?> idadeMin,
  Value<int?> idadeMax,
  Value<double?> preco,
  Value<bool?> isGratuito,
  Value<bool?> isAcessivel,
  Value<int?> duracao,
  Value<String?> horario,
  Value<String?> tags,
  Value<DateTime?> updatedAt,
  required DateTime cachedAt,
});
typedef $$CachedPoisTableUpdateCompanionBuilder = CachedPoisCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<String?> descricao,
  Value<String> categoria,
  Value<String?> subcategoria,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String?> morada,
  Value<String?> cidade,
  Value<String?> codPostal,
  Value<String?> pais,
  Value<String?> telefone,
  Value<String?> email,
  Value<String?> website,
  Value<int?> idadeMin,
  Value<int?> idadeMax,
  Value<double?> preco,
  Value<bool?> isGratuito,
  Value<bool?> isAcessivel,
  Value<int?> duracao,
  Value<String?> horario,
  Value<String?> tags,
  Value<DateTime?> updatedAt,
  Value<DateTime> cachedAt,
});

class $$CachedPoisTableFilterComposer
    extends Composer<_$AppDatabase, $CachedPoisTable> {
  $$CachedPoisTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoria => $composableBuilder(
      column: $table.categoria, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subcategoria => $composableBuilder(
      column: $table.subcategoria, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get morada => $composableBuilder(
      column: $table.morada, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cidade => $composableBuilder(
      column: $table.cidade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codPostal => $composableBuilder(
      column: $table.codPostal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pais => $composableBuilder(
      column: $table.pais, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idadeMin => $composableBuilder(
      column: $table.idadeMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idadeMax => $composableBuilder(
      column: $table.idadeMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get preco => $composableBuilder(
      column: $table.preco, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isGratuito => $composableBuilder(
      column: $table.isGratuito, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAcessivel => $composableBuilder(
      column: $table.isAcessivel, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duracao => $composableBuilder(
      column: $table.duracao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get horario => $composableBuilder(
      column: $table.horario, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedPoisTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedPoisTable> {
  $$CachedPoisTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoria => $composableBuilder(
      column: $table.categoria, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subcategoria => $composableBuilder(
      column: $table.subcategoria,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get morada => $composableBuilder(
      column: $table.morada, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cidade => $composableBuilder(
      column: $table.cidade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codPostal => $composableBuilder(
      column: $table.codPostal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pais => $composableBuilder(
      column: $table.pais, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idadeMin => $composableBuilder(
      column: $table.idadeMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idadeMax => $composableBuilder(
      column: $table.idadeMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get preco => $composableBuilder(
      column: $table.preco, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isGratuito => $composableBuilder(
      column: $table.isGratuito, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAcessivel => $composableBuilder(
      column: $table.isAcessivel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duracao => $composableBuilder(
      column: $table.duracao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get horario => $composableBuilder(
      column: $table.horario, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedPoisTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedPoisTable> {
  $$CachedPoisTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<String> get subcategoria => $composableBuilder(
      column: $table.subcategoria, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get morada =>
      $composableBuilder(column: $table.morada, builder: (column) => column);

  GeneratedColumn<String> get cidade =>
      $composableBuilder(column: $table.cidade, builder: (column) => column);

  GeneratedColumn<String> get codPostal =>
      $composableBuilder(column: $table.codPostal, builder: (column) => column);

  GeneratedColumn<String> get pais =>
      $composableBuilder(column: $table.pais, builder: (column) => column);

  GeneratedColumn<String> get telefone =>
      $composableBuilder(column: $table.telefone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<int> get idadeMin =>
      $composableBuilder(column: $table.idadeMin, builder: (column) => column);

  GeneratedColumn<int> get idadeMax =>
      $composableBuilder(column: $table.idadeMax, builder: (column) => column);

  GeneratedColumn<double> get preco =>
      $composableBuilder(column: $table.preco, builder: (column) => column);

  GeneratedColumn<bool> get isGratuito => $composableBuilder(
      column: $table.isGratuito, builder: (column) => column);

  GeneratedColumn<bool> get isAcessivel => $composableBuilder(
      column: $table.isAcessivel, builder: (column) => column);

  GeneratedColumn<int> get duracao =>
      $composableBuilder(column: $table.duracao, builder: (column) => column);

  GeneratedColumn<String> get horario =>
      $composableBuilder(column: $table.horario, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedPoisTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedPoisTable,
    CachedPoiEntry,
    $$CachedPoisTableFilterComposer,
    $$CachedPoisTableOrderingComposer,
    $$CachedPoisTableAnnotationComposer,
    $$CachedPoisTableCreateCompanionBuilder,
    $$CachedPoisTableUpdateCompanionBuilder,
    (
      CachedPoiEntry,
      BaseReferences<_$AppDatabase, $CachedPoisTable, CachedPoiEntry>
    ),
    CachedPoiEntry,
    PrefetchHooks Function()> {
  $$CachedPoisTableTableManager(_$AppDatabase db, $CachedPoisTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedPoisTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedPoisTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedPoisTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String?> descricao = const Value.absent(),
            Value<String> categoria = const Value.absent(),
            Value<String?> subcategoria = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<String?> morada = const Value.absent(),
            Value<String?> cidade = const Value.absent(),
            Value<String?> codPostal = const Value.absent(),
            Value<String?> pais = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<int?> idadeMin = const Value.absent(),
            Value<int?> idadeMax = const Value.absent(),
            Value<double?> preco = const Value.absent(),
            Value<bool?> isGratuito = const Value.absent(),
            Value<bool?> isAcessivel = const Value.absent(),
            Value<int?> duracao = const Value.absent(),
            Value<String?> horario = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
          }) =>
              CachedPoisCompanion(
            id: id,
            nome: nome,
            descricao: descricao,
            categoria: categoria,
            subcategoria: subcategoria,
            latitude: latitude,
            longitude: longitude,
            morada: morada,
            cidade: cidade,
            codPostal: codPostal,
            pais: pais,
            telefone: telefone,
            email: email,
            website: website,
            idadeMin: idadeMin,
            idadeMax: idadeMax,
            preco: preco,
            isGratuito: isGratuito,
            isAcessivel: isAcessivel,
            duracao: duracao,
            horario: horario,
            tags: tags,
            updatedAt: updatedAt,
            cachedAt: cachedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            Value<String?> descricao = const Value.absent(),
            required String categoria,
            Value<String?> subcategoria = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<String?> morada = const Value.absent(),
            Value<String?> cidade = const Value.absent(),
            Value<String?> codPostal = const Value.absent(),
            Value<String?> pais = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> website = const Value.absent(),
            Value<int?> idadeMin = const Value.absent(),
            Value<int?> idadeMax = const Value.absent(),
            Value<double?> preco = const Value.absent(),
            Value<bool?> isGratuito = const Value.absent(),
            Value<bool?> isAcessivel = const Value.absent(),
            Value<int?> duracao = const Value.absent(),
            Value<String?> horario = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            required DateTime cachedAt,
          }) =>
              CachedPoisCompanion.insert(
            id: id,
            nome: nome,
            descricao: descricao,
            categoria: categoria,
            subcategoria: subcategoria,
            latitude: latitude,
            longitude: longitude,
            morada: morada,
            cidade: cidade,
            codPostal: codPostal,
            pais: pais,
            telefone: telefone,
            email: email,
            website: website,
            idadeMin: idadeMin,
            idadeMax: idadeMax,
            preco: preco,
            isGratuito: isGratuito,
            isAcessivel: isAcessivel,
            duracao: duracao,
            horario: horario,
            tags: tags,
            updatedAt: updatedAt,
            cachedAt: cachedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedPoisTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedPoisTable,
    CachedPoiEntry,
    $$CachedPoisTableFilterComposer,
    $$CachedPoisTableOrderingComposer,
    $$CachedPoisTableAnnotationComposer,
    $$CachedPoisTableCreateCompanionBuilder,
    $$CachedPoisTableUpdateCompanionBuilder,
    (
      CachedPoiEntry,
      BaseReferences<_$AppDatabase, $CachedPoisTable, CachedPoiEntry>
    ),
    CachedPoiEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
  $$ClickHistoryTableTableManager get clickHistory =>
      $$ClickHistoryTableTableManager(_db, _db.clickHistory);
  $$CachedPoisTableTableManager get cachedPois =>
      $$CachedPoisTableTableManager(_db, _db.cachedPois);
}
