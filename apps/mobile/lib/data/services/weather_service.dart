// +JUNTOS
// Ficheiro: lib/data/services/weather_service.dart
// Descrição: Serviço para obter dados de clima da API OpenWeatherMap
// Autor: Jules
// Locale: pt_PT

import 'package:weather/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Substituir pela chave de API real e guardá-la de forma segura
const String _apiKey = 'YOUR_OPENWEATHER_API_KEY';

final weatherProvider = Provider<WeatherFactory>((ref) {
  return WeatherFactory(_apiKey, language: Language.PORTUGUESE);
});

final weatherServiceProvider = Provider<WeatherService>((ref) {
  final weatherFactory = ref.watch(weatherProvider);
  return WeatherService(weatherFactory);
});

class WeatherService {
  final WeatherFactory _weatherFactory;

  WeatherService(this._weatherFactory);

  /// Obtém o clima atual para uma dada latitude e longitude.
  /// Retorna `null` se ocorrer um erro.
  Future<Weather?> getCurrentWeather(double latitude, double longitude) async {
    try {
      final weather = await _weatherFactory.currentWeatherByLocation(latitude, longitude);
      return weather;
    } catch (e) {
      // Em caso de erro (e.g., chave inválida, sem rede), retorna nulo
      print('Erro ao obter dados de clima: $e');
      return null;
    }
  }
}
