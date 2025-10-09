// +JUNTOS
// Ficheiro: lib/data/models/user.dart
// Descrição: Modelo de dados para Utilizadores
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String email;
  final String nome;
  final String? telefone;
  final DateTime? dataNascimento;
  final String role;
  final bool ativo;
  final bool emailVerificado;
  final DateTime? criadoEm;
  final DateTime? atualizadoEm;
  final DateTime? ultimoLogin;

  const User({
    this.id,
    required this.email,
    required this.nome,
    this.telefone,
    this.dataNascimento,
    required this.role,
    required this.ativo,
    required this.emailVerificado,
    this.criadoEm,
    this.atualizadoEm,
    this.ultimoLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  bool get isAdmin => role == 'ADMIN';
  bool get isUser => role == 'USER';

  @override
  List<Object?> get props => [
    id, email, nome, telefone, dataNascimento, role,
    ativo, emailVerificado, criadoEm, atualizadoEm, ultimoLogin
  ];
}
