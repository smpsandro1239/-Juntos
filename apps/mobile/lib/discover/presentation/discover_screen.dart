// +JUNTOS
// Ficheiro: lib/discover/presentation/discover_screen.dart
// Descrição: Ecrã principal de descoberta de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/providers/api_provider.dart';
import '../../data/models/poi.dart';

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

  // Filtros atuais
  int _idadeMin = 0;
  int _idadeMax = 12;
  String? _categoriaSelecionada;

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
        idadeMin: _idadeMin,
        idadeMax: _idadeMax,
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

  // Pesquisar POIs
  Future<void> _searchPois(String query) async {
    if (query.isEmpty) {
      await _loadNearbyPois();
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final poiService = ref.read(poiServiceProvider);
      final pois = await poiService.search(query: query);

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

  // Filtrar por categoria
  Future<void> _filterByCategory(String categoria) async {
    setState(() {
      _categoriaSelecionada = categoria;
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final poiService = ref.read(poiServiceProvider);
      final pois = await poiService.findByCategory(categoria);

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
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: Column(
        children: [
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              controller: _searchController,
              hintText: l10n.pesquisar,
              leading: const Icon(Icons.search),
              onSubmitted: (value) {
                _searchPois(value);
              },
              trailing: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _loadNearbyPois();
                    },
                  ),
              ],
            ),
          ),

          // Filtros rápidos
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip(l10n.gratis, Icons.money_off),
                _buildFilterChip(l10n.interior, Icons.home),
                _buildFilterChip(l10n.exterior, Icons.park),
                _buildFilterChip(l10n.acessivel, Icons.accessible),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Categorias
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Categorias',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryCard(l10n.parques, Icons.playground_outlined, Colors.green, 'Parque'),
                _buildCategoryCard(l10n.museus, Icons.museum_outlined, Colors.purple, 'Museu'),
                _buildCategoryCard(l10n.praias, Icons.beach_access_outlined, Colors.blue, 'Praia'),
                _buildCategoryCard(l10n.trilhos, Icons.hiking_outlined, Colors.brown, 'Trilho'),
                _buildCategoryCard(l10n.teatros, Icons.theater_comedy_outlined, Colors.red, 'Teatro'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Lista de POIs próximos
          Expanded(
            child: _buildPoiList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
        onSelected: (selected) {
          // TODO: Implementar filtro
        },
      ),
    );
  }

  Widget _buildPoiList() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Erro ao carregar POIs',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              _errorMessage!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadNearbyPois,
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      );
    }

    if (_pois.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhum POI encontrado',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Tente ajustar os filtros ou pesquisar por outro termo',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadNearbyPois,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _pois.length,
        itemBuilder: (context, index) => _buildPoiCard(_pois[index]),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color, String categoria) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        child: InkWell(
          onTap: () {
            _filterByCategory(categoria);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 32),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPoiCard(Poi poi) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Navegar para tela de detalhes
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                        Text(
                          poi.enderecoCompleto.isNotEmpty ? poi.enderecoCompleto : 'Localização não disponível',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.euro, size: 16, color: Colors.grey[600]),
                        Text(poi.precoFormatado, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Implementar sistema de favoritos
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sistema de favoritos - Em breve!')),
                  );
                },
                icon: const Icon(Icons.favorite_border),
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
