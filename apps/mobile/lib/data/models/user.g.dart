// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      nome: json['nome'] as String,
      telefone: json['telefone'] as String?,
      dataNascimento: json['dataNascimento'] == null
          ? null
          : DateTime.parse(json['dataNascimento'] as String),
      role: json['role'] as String,
      ativo: json['ativo'] as bool,
      emailVerificado: json['emailVerificado'] as bool,
      criadoEm: json['criadoEm'] == null
          ? null
          : DateTime.parse(json['criadoEm'] as String),
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
      ultimoLogin: json['ultimoLogin'] == null
          ? null
          : DateTime.parse(json['ultimoLogin'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'telefone': instance.telefone,
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
      'role': instance.role,
      'ativo': instance.ativo,
      'emailVerificado': instance.emailVerificado,
      'criadoEm': instance.criadoEm?.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm?.toIso8601String(),
      'ultimoLogin': instance.ultimoLogin?.toIso8601String(),
    };
