// +JUNTOS
// Ficheiro: lib/discover/presentation/discover_screen.dart
// Descrição: Ecrã principal de descoberta de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile/core/providers/cache_manager.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/core/providers/services_provider.dart';
import '../../core/providers/api_provider.dart';
import '../../data/models/poi.dart';
import '../application/filter_notifier.dart';
import '../../core/ui/widgets/empty_state_widget.dart';
import 'widgets/partner_ad_card.dart';
import '../application/recommendation_service.dart';
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
      final filterState = ref.read(filterNotifierProvider);

      // Coordenadas de Lisboa como fallback
      const double lisboaLat = 38.7223;
      const double lisboaLng = -9.1393;

      final pois = await poiService.findNearby(
        latitude: lisboaLat,
        longitude: lisboaLng,
        idadeMin: 0,
        idadeMax: 12,
        limite: 50, // Aumentar o limite para ter mais resultados para filtrar
        isFree: filterState.isFree,
        isIndoor: filterState.isIndoor,
      );

      // Ordenar os POIs usando o algoritmo "Momento"
      final recommendationService = ref.read(recommendationServiceProvider);
      final sortedPois = await recommendationService.sortPois(pois);

      // Guardar os POIs originais (não ordenados) na cache
      final cachedPoisDao = ref.read(cachedPoisDaoProvider);
      await cachedPoisDao.cachePois(pois);

      setState(() {
        _pois = sortedPois;
        _isLoading = false;
      });
    } catch (e) {
      // Se a chamada à API falhar, tenta carregar da cache
      try {
        final cachedPoisDao = ref.read(cachedPoisDaoProvider);
        final cachedPois = await cachedPoisDao.getAllCachedPois();

        if (cachedPois.isNotEmpty) {
          // Analytics
          ref.read(analyticsServiceProvider).logOfflineModeTrigger();

          // Ordena os POIs da cache também
          final recommendationService = ref.read(recommendationServiceProvider);
          final sortedPois = await recommendationService.sortPois(cachedPois);
          setState(() {
            _pois = sortedPois;
            _isLoading = false;
            // Opcional: mostrar uma mensagem a dizer que os dados são da cache
          });
        } else {
          // Se a cache normal estiver vazia, tenta o bundle essencial
          final essentialPoisDao = ref.read(essentialPoisDaoProvider);
          final essentialPois = await essentialPoisDao.getAllEssentialPois();

          if (essentialPois.isNotEmpty) {
            // Analytics
            ref.read(analyticsServiceProvider).logOfflineModeTrigger();

            // Ordena os POIs do bundle também
            final recommendationService = ref.read(recommendationServiceProvider);
            final sortedPois = await recommendationService.sortPois(essentialPois);
            setState(() {
              _pois = sortedPois;
              _isLoading = false;
              // Opcional: mostrar uma mensagem a dizer que os dados são do bundle offline
            });
          } else {
            // Se tudo falhar, mostra o erro
            setState(() {
              _errorMessage = 'Sem ligação à Internet e sem dados em cache.\n$e';
              _isLoading = false;
            });
          }
        }
      } catch (cacheError) {
        // Se a leitura da cache falhar, mostra ambos os erros
        setState(() {
          _errorMessage = 'Erro ao aceder à API e à cache.\nAPI Error: $e\nCache Error: $cacheError';
          _isLoading = false;
        });
      }
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
            child: Semantics(
              label: "Campo de pesquisa de atividades",
              child: SearchBar(
                controller: _searchController,
                hintText: "Pesquisar", // l10n.pesquisar,
                leading: const Icon(Icons.search),
                onSubmitted: (value) {
                  // _searchPois(value);
                },
              ),
            ),
          ),

          // Filtros
          SizedBox(
            height: 50,
            child: Consumer(
              builder: (context, ref, child) {
                final filterState = ref.watch(filterNotifierProvider);
                final filterNotifier = ref.read(filterNotifierProvider.notifier);
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Semantics(
                      label: "Filtro de atividades gratuitas",
                      checked: filterState.isFree ?? false,
                      child: FilterChip(
                        label: const Text("Grátis"),
                        selected: filterState.isFree ?? false,
                        onSelected: (_) {
                          filterNotifier.toggleFree();
                          _loadNearbyPois();
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Semantics(
                      label: "Filtro de atividades de interior",
                      checked: filterState.isIndoor == true,
                      child: FilterChip(
                        label: const Text("Interior"),
                        selected: filterState.isIndoor == true,
                        onSelected: (_) {
                          filterNotifier.toggleIndoor();
                          _loadNearbyPois();
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Semantics(
                      label: "Filtro de atividades de exterior",
                      checked: filterState.isIndoor == false,
                      child: FilterChip(
                        label: const Text("Exterior"),
                        selected: filterState.isIndoor == false,
                        onSelected: (_) {
                          filterNotifier.toggleOutdoor();
                          _loadNearbyPois();
                        },
                      ),
                    ),
                  ],
                );
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
          return EmptyStateWidget(
            lottieAsset: 'assets/lottie/connection_error.json',
            message: _errorMessage!,
            onRetry: _loadNearbyPois,
          );
        }

        if (_pois.isEmpty) {
          return const EmptyStateWidget(
            lottieAsset: 'assets/lottie/no_data.json',
            message: 'Não encontrámos atividades com os filtros selecionados.',
          );
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
    const adInterval = 15;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _pois.length + (_pois.length ~/ adInterval),
      itemBuilder: (context, index) {
        if (index > 0 && (index + 1) % (adInterval + 1) == 0) {
          return const PartnerAdCard();
        }
        final poiIndex = index - (index ~/ (adInterval + 1));
        return _buildPoiCard(_pois[poiIndex]);
      },
    );
  }

  // Grelha para tablets
  Widget _buildPoiGridView(double maxWidth) {
    const adInterval = 15;
    final crossAxisCount = (maxWidth / 300).floor().clamp(2, 4);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.9,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _pois.length + (_pois.length ~/ adInterval),
      itemBuilder: (context, index) {
        if (index > 0 && (index + 1) % (adInterval + 1) == 0) {
          return const PartnerAdCard();
        }
        final poiIndex = index - (index ~/ (adInterval + 1));
        return _buildPoiGridCard(_pois[poiIndex]);
      },
    );
  }

  Widget _buildPoiGridCard(Poi poi) {
    return Semantics(
      label: "Atividade: ${poi.nome}, ${poi.cidade ?? ''}",
      hint: "Toque para ver mais detalhes",
      button: true,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Analytics
            ref.read(analyticsServiceProvider).logActivityTap(poi.id, poi.nome);
            // Registar o clique para o algoritmo
            ref.read(clickHistoryDaoProvider).addClick(poi.id);

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
              child: CachedNetworkImage(
                cacheManager: ref.watch(imageCacheManagerProvider),
                imageUrl: poi.fotos?.first ?? 'https://via.placeholder.com/300x200',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, color: Colors.grey),
                ),
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
    ));
  }

  Widget _buildPoiCard(Poi poi) {
    return Semantics(
      label: "Atividade: ${poi.nome}, ${poi.cidade ?? ''}",
      hint: "Toque para ver mais detalhes",
      button: true,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: InkWell(
          onTap: () {
            // Analytics
            ref.read(analyticsServiceProvider).logActivityTap(poi.id, poi.nome);
            // Registar o clique para o algoritmo
            ref.read(clickHistoryDaoProvider).addClick(poi.id);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  cacheManager: ref.watch(imageCacheManagerProvider),
                  imageUrl: poi.fotos?.first ?? 'https://via.placeholder.com/150',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error, color: Colors.grey),
                  ),
                ),
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
    ));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
