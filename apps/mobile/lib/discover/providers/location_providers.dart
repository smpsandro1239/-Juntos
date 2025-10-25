// +JUNTOS
// Ficheiro: lib/discover/providers/location_providers.dart
// Descrição: Providers do Riverpod para dados de localização
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile/discover/models/location.dart';

part 'location_providers.g.dart';

@riverpod
Future<Location> userLocation(UserLocationRef ref) async {
  // TODO: Substituir por um serviço de geolocalização real (ex: geolocator)
  // Usar uma localização fixa em Lisboa para fins de desenvolvimento
  await Future.delayed(const Duration(milliseconds: 500)); // Simular chamada de API
  return const Location(latitude: 38.7223, longitude: -9.1393);
}
