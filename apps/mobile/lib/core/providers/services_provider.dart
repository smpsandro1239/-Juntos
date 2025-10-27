// +JUNTOS
// Ficheiro: lib/core/providers/services_provider.dart
// Descrição: Providers do Riverpod para os serviços core da aplicação
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile/core/services/weather/weather_service.dart';
import 'package:mobile/core/services/analytics/analytics_service.dart';
import 'package:mobile/core/services/bundle/bundle_download_service.dart';

part 'services_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  // Configuração base do Dio, pode ser expandida com interceptors
  return Dio();
}

@riverpod
WeatherService weatherService(WeatherServiceRef ref) {
  return WeatherService(ref.watch(dioProvider));
}

@riverpod
AnalyticsService analyticsService(AnalyticsServiceRef ref) {
  return AnalyticsService();
}

@riverpod
BundleDownloadService bundleDownloadService(BundleDownloadServiceRef ref) {
  return BundleDownloadService(ref);
}

// Provider para aceder à chave da API de forma segura
@riverpod
String openWeatherApiKey(OpenWeatherApiKeyRef ref) {
  final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
  if (apiKey == null || apiKey.isEmpty || apiKey == 'YOUR_OPENWEATHER_API_KEY') {
    throw Exception('OPENWEATHER_API_KEY não está definida no ficheiro .env');
  }
  return apiKey;
}
