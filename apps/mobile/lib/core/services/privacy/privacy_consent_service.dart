// +JUNTOS
// Ficheiro: lib/core/services/privacy/privacy_consent_service.dart
// Descrição: Serviço para gerir o consentimento de privacidade e o pedido ATT
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'dart:io';

class PrivacyConsentService {
  static const String _sessionCountKey = 'session_count';
  static const String _attStatusKey = 'att_status';

  Future<void> incrementSessionCount() async {
    final prefs = await SharedPreferences.getInstance();
    final currentCount = prefs.getInt(_sessionCountKey) ?? 0;
    await prefs.setInt(_sessionCountKey, currentCount + 1);
  }

  Future<void> checkAndRequestConsent() async {
    // Só executa em iOS
    if (!Platform.isIOS) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final sessionCount = prefs.getInt(_sessionCountKey) ?? 0;
    final currentStatus = await AppTrackingTransparency.trackingAuthorizationStatus;

    // Pede o consentimento na segunda sessão, se ainda não foi pedido
    if (sessionCount >= 2 && currentStatus == TrackingStatus.notDetermined) {
      // Mostrar um diálogo explicativo antes do pedido oficial (boa prática)
      // TODO: Implementar um diálogo personalizado

      // Pedir o consentimento ATT
      final status = await AppTrackingTransparency.requestTrackingAuthorization();
      await prefs.setString(_attStatusKey, status.toString());
    }
  }

  Future<TrackingStatus> get trackingStatus async {
    return await AppTrackingTransparency.trackingAuthorizationStatus;
  }
}
