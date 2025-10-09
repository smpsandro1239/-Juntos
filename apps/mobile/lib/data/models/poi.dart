// +JUNTOS
// Ficheiro: lib/data/models/poi.dart
// Descrição: Modelo de dados para Pontos de Interesse
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poi.g.dart';

@JsonSerializable()
class Poi extends Equatable {
  final int? id;
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
  final DateTime? criadoEm;
  final DateTime? atualizadoEm;

  const Poi({
    this.id,
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
    this.criadoEm,
    this.atualizadoEm,
  });

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);

  // Computed properties
  String get enderecoCompleto {
    final partes = [morada, codigoPostal, cidade, distrito].where((p) => p != null && p.isNotEmpty);
    return partes.join(', ');
  }

  String get precoFormatado {
    if (precoMin == 0 && precoMax == 0) return 'Grátis';
    if (precoMin == precoMax) return '${precoMin.toStringAsFixed(2)}€';
    return '${precoMin.toStringAsFixed(2)}€ - ${precoMax.toStringAsFixed(2)}€';
  }

  bool get isGratis => precoMin == 0 && precoMax == 0;

  @override
  List<Object?> get props => [
    id, nome, descricao, categoria, idadeMin, idadeMax,
    precoMin, precoMax, latitude, longitude, morada,
    codigoPostal, cidade, distrito, telefone, website,
    email, horarioAbertura, horarioFecho, acessibilidade,
    estacionamento, wc, cafetaria, interior, exterior,
    ativo, criadoEm, atualizadoEm
  ];
}
