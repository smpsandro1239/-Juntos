// +JUNTOS
// Ficheiro: lib/data/models/auth.dart
// Descrição: Modelos de dados para autenticação
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

// Request para login
@JsonSerializable()
class LoginRequest extends Equatable {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  List<Object> get props => [email, password];
}

// Request para registo
@JsonSerializable()
class SignupRequest extends Equatable {
  final String nome;
  final String email;
  final String password;
  final String? telefone;

  const SignupRequest({
    required this.nome,
    required this.email,
    required this.password,
    this.telefone,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);

  @override
  List<Object?> get props => [nome, email, password, telefone];
}

// Response de autenticação
@JsonSerializable()
class JwtResponse extends Equatable {
  @JsonKey(name: 'accessToken')
  final String accessToken;

  @JsonKey(name: 'tokenType')
  final String tokenType;

  final int id;
  final String email;
  final String nome;
  final String role;

  const JwtResponse({
    required this.accessToken,
    required this.tokenType,
    required this.id,
    required this.email,
    required this.nome,
    required this.role,
  });

  factory JwtResponse.fromJson(Map<String, dynamic> json) => _$JwtResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JwtResponseToJson(this);

  String get token => '$tokenType $accessToken';

  @override
  List<Object> get props => [accessToken, tokenType, id, email, nome, role];
}

// Response genérica de mensagem
@JsonSerializable()
class MessageResponse extends Equatable {
  final String message;

  const MessageResponse({required this.message});

  factory MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);

  @override
  List<Object> get props => [message];
}
