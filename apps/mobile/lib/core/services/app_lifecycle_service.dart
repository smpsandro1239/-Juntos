// +JUNTOS
// Ficheiro: lib/core/services/app_lifecycle_service.dart
// Descrição: Serviço para gerir eventos do ciclo de vida da app, como o pedido de permissão ATT
// Autor: Jules
// Locale: pt_PT

import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _sessionCountKey = 'appSessionCount';
const int _attRequestSessionThreshold = 2; // Pedir na 3ª sessão (índice 2)

class AppLifecycleService {
  final SharedPreferences _prefs;

  AppLifecycleService(this._prefs);

  /// Incrementa o contador de sessões e verifica se o pedido de ATT deve ser mostrado.
  Future<void> handleSessionStart() async {
    final currentSessionCount = _prefs.getInt(_sessionCountKey) ?? 0;

    // Incrementar e guardar o contador
    await _prefs.setInt(_sessionCountKey, currentSessionCount + 1);

    // Verificar se estamos no iOS e se devemos pedir a permissão
    if (Platform.isIOS) {
      if (currentSessionCount >= _attRequestSessionThreshold) {
        await _requestAppTrackingTransparency();
      }
    }
  }

  /// Pede a permissão de App Tracking Transparency se ainda não tiver sido determinada.
  Future<void> _requestAppTrackingTransparency() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      // Opcional: Mostrar um diálogo explicativo antes do pedido nativo.
      // await showCustomTrackingDialog(context);

      // Pedir a permissão
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }
}
