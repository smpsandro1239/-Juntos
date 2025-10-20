// +JUNTOS
// Ficheiro: lib/core/services/analytics_service.dart
// Descrição: Serviço para encapsular o registo de eventos de analytics
// Autor: Jules
// Locale: pt_PT

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService();
});

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // --- Eventos Definidos na Task 8.1 ---

  /// Utilizador completou o onboarding
  Future<void> logOnboardingComplete() async {
    await _analytics.logEvent(name: 'onboarding_complete');
  }

  /// Utilizador tocou numa atividade
  Future<void> logActivityTap(int poiId, String poiName) async {
    await _analytics.logEvent(
      name: 'activity_tap',
      parameters: {'poi_id': poiId, 'poi_name': poiName},
    );
  }

  /// Utilizador adicionou ou removeu um favorito
  Future<void> logFavoriteToggle(int poiId, String poiName, bool isFavorite) async {
    await _analytics.logEvent(
      name: 'favorite_toggle',
      parameters: {
        'poi_id': poiId,
        'poi_name': poiName,
        'is_favorite': isFavorite.toString(),
      },
    );
  }

  /// Utilizador partilhou uma atividade
  Future<void> logShare(int poiId, String poiName) async {
    await _analytics.logEvent(
      name: 'share',
      parameters: {'poi_id': poiId, 'poi_name': poiName},
    );
  }

  /// Utilizador tocou num anúncio de parceiro
  Future<void> logPartnerTap(String partnerName) async {
    await _analytics.logEvent(
      name: 'partner_tap',
      parameters: {'partner_name': partnerName},
    );
  }

  /// A aplicação foi iniciada em modo offline
  Future<void> logOfflineModeTrigger() async {
    await _analytics.logEvent(name: 'offline_mode_trigger');
  }
}
