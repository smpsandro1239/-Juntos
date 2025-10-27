// +JUNTOS
// Ficheiro: lib/core/services/bundle/bundle_download_service.dart
// Descrição: Serviço para gerir o download do bundle essencial
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/providers/api_provider.dart';

class BundleDownloadService {
  final Ref _ref;

  BundleDownloadService(this._ref);

  Future<void> downloadAndStoreBundle() async {
    final essentialPoisDao = _ref.read(essentialPoisDaoProvider);
    final poiService = _ref.read(poiServiceProvider);

    try {
      // Verificar se o bundle já existe para não descarregar desnecessariamente
      final poiCount = await essentialPoisDao.countPois();
      if (poiCount > 0) {
        print('Bundle essencial já existe. Download ignorado.');
        return;
      }

      print('A descarregar o bundle essencial...');
      // Coordenadas de Portugal continental para obter uma vasta gama de POIs
      final pois = await poiService.findNearby(
        latitude: 39.5,
        longitude: -8.0,
        raio: 500, // Raio alargado para cobrir o país
        limite: 200,
      );

      if (pois.isNotEmpty) {
        await essentialPoisDao.storeBundle(pois);
        print('Bundle essencial guardado com ${pois.length} atividades.');
      }
    } catch (e) {
      print('Erro ao descarregar o bundle essencial: $e');
      // O erro é apenas impresso, não relançado,
      // para não bloquear a app se o download falhar.
    }
  }
}
