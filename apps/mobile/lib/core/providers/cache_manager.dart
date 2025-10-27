// +JUNTOS
// Ficheiro: lib/core/providers/cache_manager.dart
// Descrição: Provider para a instância personalizada do CacheManager
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_manager.g.dart';

@riverpod
CacheManager imageCacheManager(ImageCacheManagerRef ref) {
  return CacheManager(
    Config(
      'juntosImageCache',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 200, // Limitar o número de imagens em cache
    ),
  );
}
