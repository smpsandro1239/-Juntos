// +JUNTOS
// Ficheiro: lib/domain/services/recommendation_service.dart
// Descrição: Serviço para o algoritmo de recomendação "Momento"
// Autor: Jules
// Locale: pt_PT

import 'dart:math';
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

  // Pontuação de Localização (baseada na distância Haversine)
  double _locationScore(Poi poi, double userLat, double userLng) {
    const R = 6371; // Raio da Terra em km
    final dLat = _degToRad(poi.latitude - userLat);
    final dLng = _degToRad(poi.longitude - userLng);
    final lat1 = _degToRad(userLat);
    final lat2 = _degToRad(poi.latitude);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLng / 2) * sin(dLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final distance = R * c; // Distância em km

    // Usamos uma função de decaimento exponencial para uma pontuação mais natural.
    // Ex: a 0km -> score=1.0; a 10km -> score ~0.6; a 50km -> score ~0.13
    return exp(-distance / 20).clamp(0.0, 1.0);
  }

  double _degToRad(double deg) {
    return deg * (pi / 180);
  }

  // Pontuação de Idade (1.0 se houver correspondência, 0.0 caso contrário)
  double _ageScore(Poi poi, Set<String> ageRanges) {
    if (ageRanges.isEmpty) return 0.5; // Pontuação neutra se nenhum filtro for aplicado

    final poiAgeRange = poi.idadeMax - poi.idadeMin;

    for (final range in ageRanges) {
      final ages = _parseAgeRange(range);
      if (ages == null) continue;

      // Verifica se há sobreposição entre a faixa etária do POI e a do filtro
      final filterRange = ages.item2 - ages.item1;
      final overlap = max(0, min(poi.idadeMax, ages.item2) - max(poi.idadeMin, ages.item1));

      if (overlap > 0) {
        // A pontuação é maior se a faixa do POI estiver contida na faixa do filtro
        if (poi.idadeMin >= ages.item1 && poi.idadeMax <= ages.item2) {
          return 1.0;
        }
        // Pontuação parcial baseada na percentagem de sobreposição
        return max(overlap / poiAgeRange, overlap / filterRange);
      }
    }

    return 0.0; // Nenhuma correspondência
  }

  // Converte uma string "min-max" para um Tuple<int, int>
  (int, int)? _parseAgeRange(String range) {
    final parts = range.split('-');
    if (parts.length != 2) return null;
    final min = int.tryParse(parts[0]);
    final max = int.tryParse(parts[1]);
    if (min == null || max == null) return null;
    return (min, max);
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
    if (recentClicks.contains(poi.id)) {
      return 1.0; // Boost máximo para um item clicado
    }

    // Se não foi clicado diretamente, verifica se um POI da mesma categoria foi
    // Esta parte assume que tens acesso à lista completa de POIs para encontrar os que foram clicados
    // Como não temos a lista completa aqui, esta lógica é simplificada.
    // Numa implementação real, poderíamos passar os POIs clicados para este método.
    // Por agora, vamos retornar um valor neutro se não for um clique direto.
    // Para uma lógica mais avançada, seria necessário algo como:
    // final clickedPois = allPois.where((p) => recentClicks.contains(p.id));
    // if (clickedPois.any((p) => p.categoria == poi.categoria)) {
    //   return 0.5;
    // }

    return 0.0; // Nenhum histórico relevante
  }
}

// Classe auxiliar para guardar o POI com a sua pontuação
class _ScoredPoi {
  final Poi poi;
  final double score;
  _ScoredPoi(this.poi, this.score);
}
