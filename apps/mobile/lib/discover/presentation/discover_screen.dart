// +JUNTOS
// Ficheiro: lib/discover/presentation/discover_screen.dart
// Descrição: Ecrã principal de descoberta de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/providers/image_cache_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/providers/api_provider.dart';
import '../../data/models/poi.dart';
import '../../data/local/database/app_database.dart';
import 'details/poi_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/widgets/empty_state.dart';
import '../../data/services/weather_service.dart';
import 'providers/filter_provider.dart';
import 'widgets/poi_card_placeholder.dart';
import 'package:weather/weather.dart';
import '../../data/models/partner_ad.dart';
import 'widgets/partner_ad_card.dart';

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
  Weather? _currentWeather;

  // Filtros atuais
  int _idadeMin = 0;
  int _idadeMax = 12;
  String? _categoriaSelecionada;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    // Carrega POIs e dados de clima em paralelo
    await Future.wait([
      _loadNearbyPois(),
      _loadWeatherData(),
    ]);
  }

  // Carregar dados de clima
  Future<void> _loadWeatherData() async {
    final weatherService = ref.read(weatherServiceProvider);
    // Usar a mesma localização fallback de Lisboa
    const double lisboaLat = 38.7223;
    const double lisboaLng = -9.1393;
    final weather = await weatherService.getCurrentWeather(lisboaLat, lisboaLng);
    if (mounted) {
      setState(() {
        _currentWeather = weather;
      });
    }
  }

  // Carregar POIs próximos (Lisboa como localização padrão)
  Future<void> _loadNearbyPois() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final database = ref.read(appDatabaseProvider);
    const double lisboaLat = 38.7223;
    const double lisboaLng = -9.1393;

    try {
      // 1. Tentar obter dados da API
      final poiService = ref.read(poiServiceProvider);
      var pois = await poiService.findNearby(
        latitude: lisboaLat,
        longitude: lisboaLng,
        idadeMin: _idadeMin,
        idadeMax: _idadeMax,
        limite: 100,
      );

      // 2. Guardar em cache se for bem-sucedido
      await database.cachedPoisDao.replaceCachedPois(pois);

      // Aplicar o algoritmo "Momento"
      final recommendationService = ref.read(recommendationServiceProvider);
      final filterState = await ref.read(filterNotifierProvider.future);
      pois = await recommendationService.sortPois(
        pois,
        userLat: lisboaLat,
        userLng: lisboaLng,
        weather: _currentWeather,
        ageRanges: filterState.ageRanges,
      );

      if (mounted) {
        setState(() {
          _pois = pois;
          _isLoading = false;
        });
      }
    } catch (e) {
      // 3. Em caso de erro (offline), fazer fallback para a cache
      final cached = await database.cachedPoisDao.getAllCachedPois();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Modo offline: a mostrar as últimas atividades guardadas.'),
            backgroundColor: Colors.orange,
          ),
        );

        final poisFromCache = cached.map((cp) => _cachedPoiToPoi(cp)).toList();

        // TODO: Ordenar por distância

        setState(() {
          _pois = poisFromCache;
          _isLoading = false;
          // Não mostrar um erro, pois temos dados da cache
        });
      }
    }
  }

  // Converte um CachedPoi para um Poi
  Poi _cachedPoiToPoi(CachedPoi cached) {
    return Poi(
      id: cached.poiId,
      nome: cached.nome,
      descricao: cached.descricao,
      categoria: cached.categoria,
      idadeMin: cached.idadeMin,
      idadeMax: cached.idadeMax,
      precoMin: cached.precoMin,
      precoMax: cached.precoMax,
      latitude: cached.latitude,
      longitude: cached.longitude,
      morada: cached.morada,
      codigoPostal: cached.codigoPostal,
      cidade: cached.cidade,
      distrito: cached.distrito,
      telefone: cached.telefone,
      website: cached.website,
      email: cached.email,
      horarioAbertura: cached.horarioAbertura,
      horarioFecho: cached.horarioFecho,
      acessibilidade: cached.acessibilidade,
      estacionamento: cached.estacionamento,
      wc: cached.wc,
      cafetaria: cached.cafetaria,
      interior: cached.interior,
      exterior: cached.exterior,
      fotos: cached.fotos,
      ativo: true, // Assumir ativo se estiver em cache
    );
  }

  // Abrir URL do parceiro com tracking
  Future<void> _launchPartnerUrl(String url) async {
    final uri = Uri.parse(url).replace(queryParameters: {
      ...Uri.parse(url).queryParameters,
      'utm_source': 'juntos_app',
    });

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Não foi possível abrir o link: $url')),
        );
      }
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
    final filterStateAsync = ref.watch(filterNotifierProvider);
    final filterNotifier = ref.read(filterNotifierProvider.notifier);

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
            child: filterStateAsync.when(
              data: (filterState) => ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  FilterChip(
                    label: Text(l10n.gratis),
                    avatar: const Icon(Icons.money_off),
                    selected: filterState.isFree ?? false,
                    onSelected: (_) => filterNotifier.toggleFree(),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(l10n.interior),
                    avatar: const Icon(Icons.home),
                    selected: filterState.isIndoor == true,
                    onSelected: (_) => filterNotifier.toggleIndoor(),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(l10n.exterior),
                    avatar: const Icon(Icons.park),
                    selected: filterState.isIndoor == false,
                    onSelected: (_) => filterNotifier.toggleOutdoor(),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(l10n.acessivel),
                    avatar: const Icon(Icons.accessible),
                    selected: filterState.hasAccessibility ?? false,
                    onSelected: (_) => filterNotifier.toggleAccessibility(),
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => const Center(child: Text('Erro ao carregar filtros')),
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
                _buildCategoryCard(l10n.parques, Icons.outdoor_grill, Colors.green, 'Parque'),
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

  Widget _buildPoiList() {
    if (_isLoading) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 5,
        itemBuilder: (context, index) => const PoiCardPlaceholder(),
      );
    }

    if (_errorMessage != null) {
      return EmptyStateWidget(
        lottieAsset: 'assets/lottie/error.json',
        title: 'Erro de Ligação',
        message: 'Não foi possível carregar as atividades. Verifica a tua ligação à internet e tenta novamente.',
        onRetry: _loadNearbyPois,
      );
    }

    if (_pois.isEmpty) {
      return const EmptyStateWidget(
        lottieAsset: 'assets/lottie/empty_search.json',
        title: 'Nenhuma atividade encontrada',
        message: 'Parece que não há nada por aqui. Tenta alargar a tua pesquisa ou ajustar os filtros.',
      );
    }

    const adInterval = 15;
    final adCount = (_pois.length / adInterval).floor();
    final totalItemCount = _pois.length + adCount;

    return RefreshIndicator(
      onRefresh: _loadInitialData,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: totalItemCount,
        itemBuilder: (context, index) {
          // Verifica se a posição é para um anúncio
          if (adInterval > 0 && (index + 1) % (adInterval + 1) == 0) {
            return PartnerAdCard(
              ad: PartnerAd.mockAd,
              onTap: () => _launchPartnerUrl(PartnerAd.mockAd.destinationUrl),
            );
          }

          // Ajusta o índice para aceder à lista de POIs
          final poiIndex = index - (index / (adInterval + 1)).floor();
          if (poiIndex < _pois.length) {
            return _buildPoiCard(_pois[poiIndex]);
          }

          return null; // Não deve acontecer
        },
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
    final cacheManager = ref.watch(imageCacheManagerProvider);
    final database = ref.read(appDatabaseProvider);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Registar o clique no histórico
          database.clickHistoryDao.addClick(poi.id!);

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
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: (poi.fotos != null && poi.fotos!.isNotEmpty)
                      ? CachedNetworkImage(
                          cacheManager: cacheManager,
                          imageUrl: poi.fotos!.first,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(color: Colors.white),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.error, color: Colors.red),
                          ),
                        )
                      : Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, color: Colors.grey),
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
              StreamBuilder<bool>(
                stream: ref.watch(favoritesRepositoryProvider).watchIsFavorite(poi.id!),
                builder: (context, snapshot) {
                  final isFavorite = snapshot.data ?? false;
                  return IconButton(
                    tooltip: isFavorite ? 'Remover dos favoritos' : 'Adicionar aos favoritos',
                    onPressed: () async {
                      // 1. Dar feedback tátil imediato
                      HapticFeedback.lightImpact();

                      final favoritesRepository = ref.read(favoritesRepositoryProvider);
                      try {
                        final isNowFavorite = await favoritesRepository.toggleFavorite(poi);

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isNowFavorite
                                  ? '${poi.nome} adicionado aos favoritos!'
                                  : '${poi.nome} removido dos favoritos!'
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      } catch (e) {
                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Erro ao gerir favoritos: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    // 2. Animar a mudança do ícone
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                        key: ValueKey<bool>(isFavorite), // Essencial para o AnimatedSwitcher
                      ),
                    ),
                  );
                },
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
