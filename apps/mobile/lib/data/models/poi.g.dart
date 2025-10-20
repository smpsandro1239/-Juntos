// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      categoria: json['categoria'] as String,
      idadeMin: (json['idadeMin'] as num).toInt(),
      idadeMax: (json['idadeMax'] as num).toInt(),
      precoMin: (json['precoMin'] as num).toDouble(),
      precoMax: (json['precoMax'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      morada: json['morada'] as String?,
      codigoPostal: json['codigoPostal'] as String?,
      cidade: json['cidade'] as String?,
      distrito: json['distrito'] as String?,
      telefone: json['telefone'] as String?,
      website: json['website'] as String?,
      email: json['email'] as String?,
      horarioAbertura: json['horarioAbertura'] as String?,
      horarioFecho: json['horarioFecho'] as String?,
      acessibilidade: json['acessibilidade'] as bool,
      estacionamento: json['estacionamento'] as bool,
      wc: json['wc'] as bool,
      cafetaria: json['cafetaria'] as bool,
      interior: json['interior'] as bool,
      exterior: json['exterior'] as bool,
      ativo: json['ativo'] as bool,
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
    );

Map<String, dynamic> _$PoiToJson(Poi instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'categoria': instance.categoria,
      'idadeMin': instance.idadeMin,
      'idadeMax': instance.idadeMax,
      'precoMin': instance.precoMin,
      'precoMax': instance.precoMax,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'morada': instance.morada,
      'codigoPostal': instance.codigoPostal,
      'cidade': instance.cidade,
      'distrito': instance.distrito,
      'telefone': instance.telefone,
      'website': instance.website,
      'email': instance.email,
      'horarioAbertura': instance.horarioAbertura,
      'horarioFecho': instance.horarioFecho,
      'acessibilidade': instance.acessibilidade,
      'estacionamento': instance.estacionamento,
      'wc': instance.wc,
      'cafetaria': instance.cafetaria,
      'interior': instance.interior,
      'exterior': instance.exterior,
      'ativo': instance.ativo,
      'criadoEm': instance.criadoEm?.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm?.toIso8601String(),
    };
