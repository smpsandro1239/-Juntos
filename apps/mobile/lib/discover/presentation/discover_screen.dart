// +JUNTOS
// Ficheiro: lib/discover/presentation/discover_screen.dart
// Descrição: Ecrã principal de descoberta de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/providers/api_provider.dart';
import '../../data/models/poi.dart';
import 'details/poi_details_screen.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Estado local para POIs
  List<Poi> _pois = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadNearbyPois();
  }


  // Carregar POIs próximos (Lisboa como localização padrão)
  Future<void> _loadNearbyPois() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final poiService = ref.read(poiServiceProvider);

      // Coordenadas de Lisboa como fallback
      const double lisboaLat = 38.7223;
      const double lisboaLng = -9.1393;

      final pois = await poiService.findNearby(
        latitude: lisboaLat,
        longitude: lisboaLng,
        idadeMin: 0,
        idadeMax: 12,
        limite: 20,
      );

      setState(() {
        _pois = pois;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Descobrir"), // Text(l10n.appTitle),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: Column(
        children: [
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              controller: _searchController,
              hintText: "Pesquisar", // l10n.pesquisar,
              leading: const Icon(Icons.search),
              onSubmitted: (value) {
                // _searchPois(value);
              },
            ),
          ),
          // Lista de POIs próximos
          Expanded(
            child: _buildPoiList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPoiList() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoint para tablet
        const double tabletBreakpoint = 600;
        final bool isTablet = constraints.maxWidth > tabletBreakpoint;

        if (_isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_errorMessage != null) {
          return Center(child: Text(_errorMessage!));
        }

        if (_pois.isEmpty) {
          return const Center(child: Text('Nenhum POI encontrado'));
        }

        return RefreshIndicator(
          onRefresh: _loadNearbyPois,
          child: isTablet
              ? _buildPoiGridView(constraints.maxWidth)
              : _buildPoiListView(),
        );
      },
    );
  }

  // Lista para telemóveis
  Widget _buildPoiListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _pois.length,
      itemBuilder: (context, index) => _buildPoiCard(_pois[index]),
    );
  }

  // Grelha para tablets
  Widget _buildPoiGridView(double maxWidth) {
    final crossAxisCount = (maxWidth / 300).floor().clamp(2, 4);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.9,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _pois.length,
      itemBuilder: (context, index) => _buildPoiGridCard(_pois[index]),
    );
  }

  Widget _buildPoiGridCard(Poi poi) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PoiDetailsScreen(poi: poi),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    poi.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    poi.cidade ?? 'Localização não disponível',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoiCard(Poi poi) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PoiDetailsScreen(poi: poi),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poi.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      poi.descricao ?? 'Sem descrição disponível',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
