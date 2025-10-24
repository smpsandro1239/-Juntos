// +JUNTOS
// Ficheiro: lib/onboarding/application/onboarding_notifier.dart
// Descrição: StateNotifier para gerir o estado do onboarding
// Autor: Jules
// Locale: pt_PT

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/providers/shared_preferences_provider.dart';

// Modelo de estado para o onboarding
class OnboardingState {
  final Set<String> ageRanges;
  final String? postalCode;
  final bool isCompleted;

  OnboardingState({
    this.ageRanges = const {},
    this.postalCode,
    this.isCompleted = false,
  });

  OnboardingState copyWith({
    Set<String>? ageRanges,
    String? postalCode,
    bool? isCompleted,
  }) {
    return OnboardingState(
      ageRanges: ageRanges ?? this.ageRanges,
      postalCode: postalCode ?? this.postalCode,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

// Notifier
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final SharedPreferences _prefs;

  OnboardingNotifier(this._prefs) : super(OnboardingState()) {
    _loadState();
  }

  void _loadState() {
    final ageRanges = _prefs.getStringList('onboarding_age_ranges')?.toSet() ?? {};
    final postalCode = _prefs.getString('onboarding_postal_code');
    final isCompleted = _prefs.getBool('onboarding_completed') ?? false;
    state = OnboardingState(
      ageRanges: ageRanges,
      postalCode: postalCode,
      isCompleted: isCompleted,
    );
  }

  void setAgeRanges(Set<String> ageRanges) {
    state = state.copyWith(ageRanges: ageRanges);
    _prefs.setStringList('onboarding_age_ranges', ageRanges.toList());
  }

  void setPostalCode(String postalCode) {
    state = state.copyWith(postalCode: postalCode);
    _prefs.setString('onboarding_postal_code', postalCode);
  }

  void completeOnboarding() {
    state = state.copyWith(isCompleted: true);
    _prefs.setBool('onboarding_completed', true);
  }
}

// Provider
final onboardingNotifierProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return OnboardingNotifier(prefs);
});
