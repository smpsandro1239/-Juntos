// +JUNTOS
// Ficheiro: lib/core/providers/privacy_provider.dart
// Descrição: Provider para o serviço de consentimento de privacidade
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile/core/services/privacy/privacy_consent_service.dart';

part 'privacy_provider.g.dart';

@riverpod
PrivacyConsentService privacyConsentService(PrivacyConsentServiceRef ref) {
  return PrivacyConsentService();
}
