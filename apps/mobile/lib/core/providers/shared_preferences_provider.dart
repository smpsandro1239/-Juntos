// +JUNTOS
// Ficheiro: lib/core/providers/shared_preferences_provider.dart
// Descrição: Provider para a instância do SharedPreferences
// Autor: Jules
// Locale: pt_PT

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences not initialized');
});
