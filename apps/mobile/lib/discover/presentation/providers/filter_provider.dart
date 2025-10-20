// +JUNTOS
// Ficheiro: lib/discover/presentation/providers/filter_provider.dart
// Descrição: Provider para gerir o estado dos filtros de descoberta
// Autor: Jules
// Locale: pt_PT

import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/filter_state.dart';

part 'filter_provider.g.dart';

const _filterStateKey = 'filterState';

@riverpod
class FilterNotifier extends _$FilterNotifier {
  late SharedPreferences _prefs;

  @override
  Future<FilterState> build() async {
    _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString(_filterStateKey);
    if (jsonString != null) {
      try {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        return FilterState(
           ageRanges: Set<String>.from(json['ageRanges'] as List),
          isIndoor: json['isIndoor'] as bool?,
          isFree: json['isFree'] as bool?,
          hasAccessibility: json['hasAccessibility'] as bool?,
          isShortDuration: json['isShortDuration'] as bool?,
        );
      } catch (e) {
        // Se a desserialização falhar, retorna o estado padrão
        return const FilterState();
      }
    }
    // Se não houver estado guardado, retorna o estado padrão
    return const FilterState();
  }

  Future<void> _saveState(FilterState state) async {
     final json = {
      'ageRanges': state.ageRanges.toList(),
      'isIndoor': state.isIndoor,
      'isFree': state.isFree,
      'hasAccessibility': state.hasAccessibility,
      'isShortDuration': state.isShortDuration,
    };
    await _prefs.setString(_filterStateKey, jsonEncode(json));
  }

  Future<void> setAgeRanges(Set<String> ageRanges) async {
    final newState = state.value!.copyWith(ageRanges: ageRanges);
    state = AsyncData(newState);
    await _saveState(newState);
  }

  Future<void> toggleIndoor() async {
    final newState = state.value!.copyWith(isIndoor: state.value!.isIndoor == null ? true : (state.value!.isIndoor! ? null : true));
    state = AsyncData(newState);
    await _saveState(newState);
  }

  Future<void> toggleOutdoor() async {
    final newState = state.value!.copyWith(isIndoor: state.value!.isIndoor == null ? false : (state.value!.isIndoor! ? false : null));
    state = AsyncData(newState);
    await _saveState(newState);
  }

  Future<void> toggleFree() async {
    final newState = state.value!.copyWith(isFree: !(state.value!.isFree ?? false));
    state = AsyncData(newState);
    await _saveState(newState);
  }

  Future<void> toggleAccessibility() async {
    final newState = state.value!.copyWith(hasAccessibility: !(state.value!.hasAccessibility ?? false));
    state = AsyncData(newState);
    await _saveState(newState);
  }

  Future<void> clear() async {
    state = const AsyncData(FilterState());
    await _prefs.remove(_filterStateKey);
  }
}
