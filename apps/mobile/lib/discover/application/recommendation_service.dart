// +JUNTOS
// Ficheiro: lib/discover/application/recommendation_service.dart
// Descrição: Serviço para aplicar o algoritmo de recomendação "Momento"
// Autor: (O teu nome)
// Locale: pt_PT

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/models/poi.dart';
import 'package:mobile/core/models/weather.dart';
import 'package:mobile/core/providers/api_provider.dart';
import 'package:mobile/core/providers/services_provider.dart';
import 'package:mobile/discover/models/location.dart';
import 'package:mobile/discover/providers/location_providers.dart';
import 'package:mobile/onboarding/application/onboarding_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recommendation_service.g.dart';

@riverpod
RecommendationService recommendationService(RecommendationServiceRef ref) {
  return RecommendationService(ref);
}

class RecommendationService {
  final Ref _ref;

  RecommendationService(this._ref);

  Future<List<Poi>> sortPois(List<Poi> pois) async {
    // 1. Obter dados necessários (localização, meteorologia, histórico)
    final userLocation = await _ref.read(userLocationProvider.future);
    final weather = await _getWeatherData(userLocation);
    final clickHistoryDao = _ref.read(clickHistoryDaoProvider);
    final clickedPoiIds = await clickHistoryDao.getMostClickedPoiIds();
    final onboardingState = _ref.read(onboardingNotifierProvider);
    final childrenAges = onboardingState.childrenAges;

    // 2. Calcular a pontuação para cada Poi
    final scoredPois = pois.map((poi) {
      final score = _calculateScore(poi, userLocation, weather, clickedPoiIds, childrenAges);
      return _ScoredPoi(poi, score);
    }).toList();

    // 3. Ordenar pela pontuação (do maior para o menor)
    scoredPois.sort((a, b) => b.score.compareTo(a.score));

    // 4. Retornar a lista de Pois ordenada
    return scoredPois.map((e) => e.poi).toList();
  }

  Future<Weather?> _getWeatherData(Location? location) async {
    if (location == null) return null;
    try {
      final weatherService = _ref.read(weatherServiceProvider);
      final apiKey = _ref.read(openWeatherApiKeyProvider);
      return await weatherService.getCurrentWeather(
        location.latitude,
        location.longitude,
        apiKey,
      );
    } catch (e) {
      // Em caso de erro (ex: sem net), retorna null e continua sem dados de meteorologia
      print("Erro ao obter dados de meteorologia: $e");
      return null;
    }
  }

  double _calculateScore(
    Poi poi,
    Location? userLocation,
    Weather? weather,
    List<int> clickedPoiIds,
    List<int> childrenAges,
  ) {
    // Pesos do algoritmo "Momento"
    const double locationWeight = 0.40;
    const double ageWeight = 0.30;
    const double weatherWeight = 0.20;
    const double historyWeight = 0.10;

    final locationScore = _calculateLocationScore(poi, userLocation);
    final ageScore = _calculateAgeScore(poi, childrenAges);
    final weatherScore = _calculateWeatherScore(poi, weather);
    final historyScore = _calculateHistoryScore(poi, clickedPoiIds);

    return (locationScore * locationWeight) +
           (ageScore * ageWeight) +
           (weatherScore * weatherWeight) +
           (historyScore * historyWeight);
  }

  double _calculateAgeScore(Poi poi, List<int> childrenAges) {
    if (childrenAges.isEmpty || poi.idadeMin == null || poi.idadeMax == null) {
      return 1.0; // Neutro se não houver dados
    }

    // Calcular a sobreposição entre a faixa etária do POI e as idades das crianças
    double totalOverlap = 0;
    for (final age in childrenAges) {
      if (age >= poi.idadeMin! && age <= poi.idadeMax!) {
        totalOverlap++;
      }
    }

    // Pontuação baseada na percentagem de crianças que se enquadram
    final overlapRatio = totalOverlap / childrenAges.length;

    if (overlapRatio > 0) {
      // Bónus se houver correspondência
      return 1.0 + (0.5 * overlapRatio); // Bónus até 50%
    }

    return 0.5; // Penalização se nenhuma criança se enquadrar
  }

  double _calculateHistoryScore(Poi poi, List<int> clickedPoiIds) {
    if (clickedPoiIds.contains(poi.id)) {
      // Bónus para POIs que já foram clicados
      return 1.5;
    }
    return 1.0; // Pontuação neutra
  }

  double _calculateLocationScore(Poi poi, Location? userLocation) {
    if (userLocation == null || poi.latitude == null || poi.longitude == null) return 0.0;

    final distance = _haversineDistance(
      userLocation.latitude,
      userLocation.longitude,
      poi.latitude!,
      poi.longitude!,
    );

    // Normalizar a pontuação: até 1km = pontuação máxima, >50km = pontuação mínima
    if (distance <= 1) return 1.0;
    if (distance >= 50) return 0.0;

    // Função linear decrescente entre 1km e 50km
    return 1.0 - ((distance - 1) / 49);
  }

  // Fórmula de Haversine para calcular a distância em km entre duas coordenadas
  double _haversineDistance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // Raio da Terra em km
    final dLat = (lat2 - lat1) * (3.1415926535 / 180);
    final dLon = (lon2 - lon1) * (3.1415926535 / 180);
    final a =
      sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1 * (3.1415926535 / 180)) * cos(lat2 * (3.1415926535 / 180)) *
      sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _calculateWeatherScore(Poi poi, Weather? weather) {
    if (weather == null || weather.mainCondition == null) return 1.0; // Neutro se não houver dados

    final condition = weather.mainCondition!.main.toLowerCase();

    // Se a atividade for indoor, o tempo mau não afeta, ou até beneficia
    if (poi.isIndoor) {
      if (condition == 'rain' || condition == 'snow' || condition == 'extreme') {
        return 1.2; // Aumenta a pontuação para atividades indoor com mau tempo
      }
      return 1.0; // Neutro
    }

    // Se a atividade for outdoor
    else {
      if (condition == 'rain' || condition == 'snow' || condition == 'extreme') {
        return 0.2; // Penaliza muito atividades outdoor com mau tempo
      }
      if (condition == 'clouds') {
        return 0.8; // Penaliza ligeiramente
      }
      return 1.2; // Beneficia com bom tempo
    }
  }
}

// Classe auxiliar para associar um Poi à sua pontuação
class _ScoredPoi {
  final Poi poi;
  final double score;

  _ScoredPoi(this.poi, this.score);
}
