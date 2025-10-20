// +JUNTOS
// Ficheiro: lib/onboarding/providers/onboarding_provider.dart
// Descrição: Provider para gerir o estado do processo de onboarding
// Autor: Jules
// Locale: pt_PT

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_provider.g.dart';

const String _onboardingCompletedKey = 'onboardingCompleted';

class OnboardingState {
  final Set<String> ageRanges;
  final String? postalCode;

  OnboardingState({this.ageRanges = const {}, this.postalCode});

  OnboardingState copyWith({Set<String>? ageRanges, String? postalCode}) {
    return OnboardingState(
      ageRanges: ageRanges ?? this.ageRanges,
      postalCode: postalCode ?? this.postalCode,
    );
  }
}

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  late SharedPreferences _prefs;

  @override
  Future<OnboardingState> build() async {
    _prefs = await SharedPreferences.getInstance();
    // No estado inicial, não há nada a carregar, começamos com um estado vazio.
    return OnboardingState();
  }

  void setAgeRanges(Set<String> ageRanges) {
    state = AsyncData(state.value!.copyWith(ageRanges: ageRanges));
  }

  void setPostalCode(String postalCode) {
    state = AsyncData(state.value!.copyWith(postalCode: postalCode));
  }

  Future<void> completeOnboarding() async {
    await _prefs.setBool(_onboardingCompletedKey, true);
    // Opcional: Guardar as preferências do onboarding para uso futuro
  }

  Future<void> enterGuestMode() async {
     // Não marca como concluído, para que o onboarding apareça da próxima vez
     await _prefs.setBool(_onboardingCompletedKey, false);
  }
}

// Provider para verificar se o onboarding foi concluído
final onboardingCompletedProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_onboardingCompletedKey) ?? false;
});
