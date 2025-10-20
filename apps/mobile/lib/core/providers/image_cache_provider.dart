// +JUNTOS
// Ficheiro: lib/core/providers/image_cache_provider.dart
// Descrição: Provider para o gestor de cache de imagens
// Autor: Jules
// Locale: pt_PT

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cache_provider.g.dart';

@Riverpod(keepAlive: true)
BaseCacheManager imageCacheManager(ImageCacheManagerRef ref) {
  return CacheManager(
    Config(
      'juntosImageCache',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 500, // Limite para 500 imagens em cache
    ),
  );
}
