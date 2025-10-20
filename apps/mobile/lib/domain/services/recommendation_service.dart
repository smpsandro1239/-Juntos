// +JUNTOS
// Ficheiro: lib/domain/services/recommendation_service.dart
// Descrição: Serviço para o algoritmo de recomendação "Momento"
// Autor: Jules
// Locale: pt_PT

import 'package:collection/collection.dart';
import 'package:weather/weather.dart';
import '../../data/models/poi.dart';
import '../../data/local/database/app_database.dart';

class RecommendationService {
  final AppDatabase database;

  RecommendationService(this.database);

  Future<List<Poi>> sortPois(
    List<Poi> pois, {
    required double userLat,
    required double userLng,
    required Weather? weather,
    required Set<String> ageRanges,
  }) async {
    final recentClicks = await database.clickHistoryDao.getRecentClicks();

    // 1. Calcular a pontuação para cada POI
    final scoredPois = pois.map((poi) {
      final score = _calculateScore(
        poi,
        userLat: userLat,
        userLng: userLng,
        weather: weather,
        ageRanges: ageRanges,
        recentClicks: recentClicks,
      );
      return _ScoredPoi(poi, score);
    }).toList();

    // 2. Ordenar POIs pela pontuação (do maior para o menor)
    scoredPois.sort((a, b) => b.score.compareTo(a.score));

    // 3. Retornar a lista de POIs ordenada
    return scoredPois.map((e) => e.poi).toList();
  }

  double _calculateScore(
    Poi poi, {
    required double userLat,
    required double userLng,
    required Weather? weather,
    required Set<String> ageRanges,
    required List<int> recentClicks,
  }) {
    // Pesos
    const double wLocation = 0.40;
    const double wAge = 0.30;
    const double wWeather = 0.20;
    const double wHistory = 0.10;

    // Calcular pontuações normalizadas (0.0 a 1.0)
    final locationScore = _locationScore(poi, userLat, userLng);
    final ageScore = _ageScore(poi, ageRanges);
    final weatherScore = _weatherScore(poi, weather);
    final historyScore = _historyScore(poi, recentClicks);

    // Calcular pontuação final ponderada
    final totalScore = (locationScore * wLocation) +
                       (ageScore * wAge) +
                       (weatherScore * wWeather) +
                       (historyScore * wHistory);

    return totalScore;
  }

  // Pontuação de Localização (inversamente proporcional à distância)
  double _locationScore(Poi poi, double userLat, double userLng) {
    // TODO: Implementar cálculo de distância Haversine
    // Placeholder simples por agora
    final distance = (poi.latitude - userLat).abs() + (poi.longitude - userLng).abs();
    // Normalização (assumindo uma distância máxima de 100km)
    return 1.0 - (distance / 100.0).clamp(0.0, 1.0);
  }

  // Pontuação de Idade (1.0 se houver correspondência, 0.0 caso contrário)
  double _ageScore(Poi poi, Set<String> ageRanges) {
    if (ageRanges.isEmpty) return 0.5; // Neutro se não houver preferência
    // TODO: Mapear `ageRanges` para `poi.idadeMin` e `poi.idadeMax`
    return 1.0; // Placeholder
  }

  // Pontuação de Clima (favorece indoor se estiver mau tempo, outdoor caso contrário)
  double _weatherScore(Poi poi, Weather? weather) {
    if (weather == null) return 0.5; // Neutro se não houver dados de clima

    // Simplificação: "mau tempo" = chuva, neve, tempestade
    final isBadWeather = ['Rain', 'Snow', 'Thunderstorm'].contains(weather.weatherMain);

    if (isBadWeather && poi.interior) return 1.0;
    if (!isBadWeather && poi.exterior) return 1.0;

    return 0.2; // Pontuação mais baixa se não corresponder
  }

  // Pontuação de Histórico (1.0 se o POI foi clicado recentemente, 0.5 se um da mesma categoria foi)
  double _historyScore(Poi poi, List<int> recentClicks) {
    if (recentClicks.contains(poi.id)) return 1.0;
    // TODO: Lógica para verificar a categoria
    return 0.0;
  }
}

// Classe auxiliar para guardar o POI com a sua pontuação
class _ScoredPoi {
  final Poi poi;
  final double score;
  _ScoredPoi(this.poi, this.score);
}
