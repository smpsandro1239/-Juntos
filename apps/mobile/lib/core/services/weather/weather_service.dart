// +JUNTOS
// Ficheiro: lib/core/services/weather/weather_service.dart
// Descrição: Serviço para obter dados de meteorologia da API OpenWeather
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mobile/core/models/weather.dart';

part 'weather_service.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5")
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET("/weather")
  Future<Weather> getCurrentWeather(
    @Query("lat") double latitude,
    @Query("lon") double longitude,
    @Query("appid") String apiKey, {
    @Query("units") String units = "metric",
    @Query("lang") String lang = "pt",
  });
}
