// +JUNTOS
// Ficheiro: lib/core/services/analytics/analytics_service.dart
// Descrição: Serviço para gerir o envio de eventos para o Firebase Analytics
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:firebase_analytics/firebase_analytics.dart';

enum AnalyticsEvent {
  onboardingComplete,
  activityTap,
  favoriteToggle,
  share,
  partnerTap,
  offlineModeTrigger,
}

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Método genérico para enviar eventos
  Future<void> logEvent(AnalyticsEvent event, {Map<String, Object>? parameters}) {
    return _analytics.logEvent(name: event.name, parameters: parameters);
  }

  // Métodos específicos para cada evento
  Future<void> logOnboardingComplete() => logEvent(AnalyticsEvent.onboardingComplete);
  Future<void> logActivityTap(int poiId, String poiName) => logEvent(
        AnalyticsEvent.activityTap,
        parameters: {'poi_id': poiId, 'poi_name': poiName},
      );
  Future<void> logFavoriteToggle(int poiId, bool isFavorite) => logEvent(
        AnalyticsEvent.favoriteToggle,
        parameters: {'poi_id': poiId, 'is_favorite': isFavorite ? 1 : 0},
      );
  Future<void> logShare(String contentType, String itemId) => logEvent(
        AnalyticsEvent.share,
        parameters: {'content_type': contentType, 'item_id': itemId},
      );
  Future<void> logPartnerTap(String partnerName) => logEvent(
        AnalyticsEvent.partnerTap,
        parameters: {'partner_name': partnerName},
      );
  Future<void> logOfflineModeTrigger() => logEvent(AnalyticsEvent.offlineModeTrigger);
}
