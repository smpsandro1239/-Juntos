// +JUNTOS
// Ficheiro: lib/core/models/weather.dart
// Descrição: Modelo de dados para a resposta da API de meteorologia
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'weather')
  final List<WeatherCondition> conditions;

  @JsonKey(name: 'main')
  final WeatherMain main;

  Weather({required this.conditions, required this.main});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  // Helper para obter a condição principal de forma fácil
  WeatherCondition? get mainCondition => conditions.isNotEmpty ? conditions.first : null;
}

@JsonSerializable()
class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) => _$WeatherConditionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}

@JsonSerializable()
class WeatherMain {
  @JsonKey(name: 'temp')
  final double temperature;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  final int pressure;
  final int humidity;

  WeatherMain({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json) => _$WeatherMainFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}
