// +JUNTOS
// Ficheiro: lib/discover/presentation/map/map_screen.dart
// Descrição: Tela de mapa interativo com POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/models/poi.dart';
import '../../../core/providers/api_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  MapLibreMapController? _mapController;
  List<Poi> _pois = [];
  bool _isLoading = true;
  String? _errorMessage;

  static const LatLng _initialPosition = LatLng(38.7223, -9.1393);

  @override
  void initState() {
    super.initState();
    _loadNearbyPois();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _loadNearbyPois() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final poiService = ref.read(poiServiceProvider);
      final pois = await poiService.findNearby(
        latitude: _initialPosition.latitude,
        longitude: _initialPosition.longitude,
        raio: 10000,
        limite: 100,
      );

      setState(() {
        _pois = pois;
        _isLoading = false;
      });

      if (_mapController != null) {
        await _addPoiMarkers();
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _addPoiMarkers() async {
    if (_mapController == null) return;

    await _mapController!.clearSymbols();

    for (final poi in _pois) {
      await _mapController!.addSymbol(
        SymbolOptions(
          geometry: LatLng(poi.latitude, poi.longitude),
          iconImage: 'marker-15',
          iconSize: 1.5,
          textField: poi.nome,
          textSize: 12.0,
          textOffset: const Offset(0, 2),
        ),
        poi.toJson(),
      );
    }
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
    _mapController!.onFeatureTapped.add(_onFeatureTapped);

    if (_pois.isNotEmpty) {
      _addPoiMarkers();
    }
  }

  void _onFeatureTapped(Point<double> point, LatLng coordinates, String id, String layerId, Annotation? annotation) {
    // A API do maplibre_gl retorna o `id` do feature, que é a geometria.
    // O ideal seria ter uma forma de associar o `id` ao POI.
    // Por agora, vamos procurar o POI mais próximo do ponto de toque.
    Poi? tappedPoi;
    double minDistance = double.infinity;

    for (final poi in _pois) {
      final distance = _calculateDistance(coordinates, LatLng(poi.latitude, poi.longitude));
      if (distance < minDistance) {
        minDistance = distance;
        tappedPoi = poi;
      }
    }

    // Se o POI mais próximo estiver a uma distância razoável, mostra o bottom sheet.
    if (tappedPoi != null && minDistance < 0.01) { // Threshold de tolerância
      _showPoiBottomSheet(tappedPoi);
    }
  }

  // Fórmula de Haversine simplificada para calcular distância
  double _calculateDistance(LatLng p1, LatLng p2) {
    final lat1 = p1.latitude;
    final lon1 = p1.longitude;
    final lat2 = p2.latitude;
    final lon2 = p2.longitude;
    return (lat1 - lat2).abs() + (lon1 - lon2).abs();
  }

  void _showPoiBottomSheet(Poi poi) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              poi.nome,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              poi.descricao ?? 'Sem descrição disponível',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    poi.enderecoCompleto,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.info),
                    label: const Text('Ver Detalhes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa de Atividades"), // Text(l10n.appTitle),
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              onPressed: _loadNearbyPois,
              icon: const Icon(Icons.refresh),
              tooltip: 'Atualizar POIs',
            ),
        ],
      ),
      body: Stack(
        children: [
          MapLibreMap(
            initialCameraPosition: const CameraPosition(
              target: _initialPosition,
              zoom: 12.0,
            ),
            onMapCreated: _onMapCreated,
            styleString: 'https://demotiles.maplibre.org/style.json',
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.tracking,
          ),
          if (_errorMessage != null)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Erro ao carregar POIs: $_errorMessage',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _errorMessage = null;
                          });
                        },
                        icon: const Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
