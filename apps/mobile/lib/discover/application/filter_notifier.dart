// +JUNTOS
// Ficheiro: lib/discover/application/filter_notifier.dart
// Descrição: StateNotifier para gerir o estado dos filtros de descoberta
// Autor: Jules
// Locale: pt_PT

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/providers/shared_preferences_provider.dart';

// Modelo de estado para os filtros
class FilterState {
  final bool? isFree;
  final bool? isIndoor;
  final bool? hasAccessibility;

  FilterState({
    this.isFree,
    this.isIndoor,
    this.hasAccessibility,
  });

  FilterState copyWith({
    bool? isFree,
    bool? isIndoor,
    bool? hasAccessibility,
  }) {
    return FilterState(
      isFree: isFree ?? this.isFree,
      isIndoor: isIndoor ?? this.isIndoor,
      hasAccessibility: hasAccessibility ?? this.hasAccessibility,
    );
  }
}

// Notifier
class FilterNotifier extends StateNotifier<FilterState> {
  final SharedPreferences _prefs;

  FilterNotifier(this._prefs) : super(FilterState()) {
    _loadState();
  }

  void _loadState() {
    state = FilterState(
      isFree: _prefs.getBool('filter_is_free'),
      isIndoor: _prefs.getBool('filter_is_indoor'),
      hasAccessibility: _prefs.getBool('filter_has_accessibility'),
    );
  }

  void toggleFree() {
    final newValue = state.isFree == true ? null : true;
    state = state.copyWith(isFree: newValue);
    if (newValue == null) {
      _prefs.remove('filter_is_free');
    } else {
      _prefs.setBool('filter_is_free', newValue);
    }
  }

  void toggleIndoor() {
    final newValue = state.isIndoor == true ? null : true;
    state = state.copyWith(isIndoor: newValue);
    if (newValue == null) {
      _prefs.remove('filter_is_indoor');
    } else {
      _prefs.setBool('filter_is_indoor', newValue);
    }
  }

  void toggleOutdoor() {
    final newValue = state.isIndoor == false ? null : false;
    state = state.copyWith(isIndoor: newValue);
    if (newValue == null) {
      _prefs.remove('filter_is_indoor');
    } else {
      _prefs.setBool('filter_is_indoor', newValue);
    }
  }

  void toggleAccessibility() {
    final newValue = state.hasAccessibility == true ? null : true;
    state = state.copyWith(hasAccessibility: newValue);
    if (newValue == null) {
      _prefs.remove('filter_has_accessibility');
    } else {
      _prefs.setBool('filter_has_accessibility', newValue);
    }
  }
}

// Provider
final filterNotifierProvider = StateNotifierProvider<FilterNotifier, FilterState>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return FilterNotifier(prefs);
});
