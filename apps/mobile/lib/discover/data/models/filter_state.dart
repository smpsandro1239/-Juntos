// +JUNTOS
// Ficheiro: lib/discover/data/models/filter_state.dart
// Descrição: Modelo de dados para o estado dos filtros de descoberta
// Autor: Jules
// Locale: pt_PT

import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final Set<String> ageRanges; // e.g., {'0-2 anos', '3-5 anos'}
  final bool? isIndoor;
  final bool? isFree;
  final bool? hasAccessibility;
  final bool? isShortDuration; // <= 1h

  const FilterState({
    this.ageRanges = const {},
    this.isIndoor,
    this.isFree,
    this.hasAccessibility,
    this.isShortDuration,
  });

  FilterState copyWith({
    Set<String>? ageRanges,
    bool? isIndoor,
    bool? isFree,
    bool? hasAccessibility,
    bool? isShortDuration,
  }) {
    return FilterState(
      ageRanges: ageRanges ?? this.ageRanges,
      isIndoor: isIndoor ?? this.isIndoor,
      isFree: isFree ?? this.isFree,
      hasAccessibility: hasAccessibility ?? this.hasAccessibility,
      isShortDuration: isShortDuration ?? this.isShortDuration,
    );
  }

  @override
  List<Object?> get props => [
        ageRanges,
        isIndoor,
        isFree,
        hasAccessibility,
        isShortDuration,
      ];
}
