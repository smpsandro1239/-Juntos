// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      nome: json['nome'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      telefone: json['telefone'] as String?,
    );

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'password': instance.password,
      'telefone': instance.telefone,
    };

JwtResponse _$JwtResponseFromJson(Map<String, dynamic> json) => JwtResponse(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      nome: json['nome'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$JwtResponseToJson(JwtResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'role': instance.role,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      message: json['message'] as String,
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
