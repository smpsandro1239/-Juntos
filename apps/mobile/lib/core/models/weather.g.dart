// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      conditions: (json['weather'] as List<dynamic>)
          .map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'weather': instance.conditions,
      'main': instance.main,
    };

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) => WeatherMain(
      temperature: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
