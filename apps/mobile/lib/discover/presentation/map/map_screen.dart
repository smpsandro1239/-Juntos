// +JUNTOS
// Ficheiro: lib/discover/presentation/map/map_screen.dart
// Descrição: Tela de mapa interativo com POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/models/poi.dart';
import '../../../core/providers/api_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  MapboxMapController? _mapController;
  List<Poi> _pois = [];
  bool _isLoading = true;
  String? _errorMessage;

  // Coordenadas iniciais (Lisboa)
  static const LatLng _initialPosition = LatLng(38.7223, -9.1393);

  // Mapbox access token (deve vir de configuração segura)
  // TODO: Implementar leitura de configuração segura
  static const String _mapboxAccessToken = 'pk.eyJ1IjoiZXhhbXBsZSIsImEiOiJjbGV4YW1wbGUifQ.example';

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
        raio: 10000, // 10km
        limite: 100,
      );

      setState(() {
        _pois = pois;
        _isLoading = false;
      });

      // Adicionar marcadores no mapa
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

    // Limpar marcadores existentes
    await _mapController!.clearSymbols();

    // Adicionar marcadores para cada POI
    for (final poi in _pois) {
      final symbolOptions = SymbolOptions(
        geometry: LatLng(poi.latitude, poi.longitude),
        iconImage: 'marker-15', // Ícone padrão do Mapbox
        iconSize: 1.5,
        textField: poi.nome,
        textSize: 12.0,
        textOffset: const Offset(0, 2),
        textColor: '#000000',
        textHaloColor: '#FFFFFF',
        textHaloWidth: 1.0,
      );

      await _mapController!.addSymbol(symbolOptions, {'poi': poi.toJson()});
    }
  }

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;

    // Configurar estilo do mapa
    controller.setSymbolIconAllowOverlap(true);
    controller.setSymbolIconIgnorePlacement(true);

    // Adicionar marcadores quando o mapa estiver pronto
    if (_pois.isNotEmpty) {
      _addPoiMarkers();
    }
  }

  void _onSymbolTapped(Symbol symbol) {
    // Obter dados do POI do marcador
    final poiData = symbol.data?['poi'];
    if (poiData != null) {
      final poi = Poi.fromJson(poiData);

      // Mostrar bottom sheet com detalhes do POI
      _showPoiBottomSheet(poi);
    }
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
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.euro, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  poi.precoFormatado,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: poi.isGratis ? Colors.green : Theme.of(context).primaryColor,
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
                      // TODO: Navegar para tela de detalhes
                    },
                    icon: const Icon(Icons.info),
                    label: const Text('Ver Detalhes'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // TODO: Iniciar navegação
                    },
                    icon: const Icon(Icons.directions),
                    label: const Text('Ir Até Aqui'),
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
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
          // Mapa Mapbox
          MapboxMap(
            accessToken: _mapboxAccessToken,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 12.0,
            ),
            onMapCreated: _onMapCreated,
            onSymbolTapped: _onSymbolTapped,
            styleString: 'mapbox://styles/mapbox/streets-v12',
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.Tracking,
          ),

          // Overlay de erro
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

          // Botão de localização atual
          Positioned(
            bottom: 100,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                _mapController?.animateCamera(
                  CameraUpdate.newLatLng(_initialPosition),
                );
              },
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
