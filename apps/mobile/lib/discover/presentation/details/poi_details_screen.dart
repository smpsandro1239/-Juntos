// +JUNTOS
// Ficheiro: lib/discover/presentation/details/poi_details_screen.dart
// Descrição: Tela de detalhes completa de um POI
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/models/poi.dart';
import '../../../core/providers/api_provider.dart';
import '../../../core/providers/services_provider.dart';
import 'widgets/reviews_section.dart';

class PoiDetailsScreen extends ConsumerStatefulWidget {
  final Poi poi;

  const PoiDetailsScreen({
    super.key,
    required this.poi,
  });

  @override
  ConsumerState<PoiDetailsScreen> createState() => _PoiDetailsScreenState();
}

class _PoiDetailsScreenState extends ConsumerState<PoiDetailsScreen> {
  late Poi _poi;
  final ScrollController _scrollController = ScrollController();
  double _parallaxOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _poi = widget.poi;
    _scrollController.addListener(_updateParallax);
    _loadFullPoiDetails();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateParallax);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateParallax() {
    if (_scrollController.hasClients) {
      setState(() {
        _parallaxOffset = -_scrollController.offset * 0.3;
      });
    }
  }

  Future<void> _loadFullPoiDetails() async {
    try {
      final poiService = ref.read(poiServiceProvider);
      final fullPoi = await poiService.findById(_poi.id!);

      if (fullPoi != null && mounted) {
        setState(() {
          _poi = fullPoi;
        });
      }
    } catch (e) {
      // Em caso de erro, mantém os dados que já tem
      debugPrint('Erro ao carregar detalhes completos: $e');
    }
  }

  void _toggleFavorite() async {
    final favoritesRepository = ref.read(favoritesRepositoryProvider);
    final analyticsService = ref.read(analyticsServiceProvider);

    try {
      final isNowFavorite = await favoritesRepository.toggleFavorite(_poi);

      // Analytics
      analyticsService.logFavoriteToggle(_poi.id, isNowFavorite);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isNowFavorite
                ? '${_poi.nome} adicionado aos favoritos!'
                : '${_poi.nome} removido dos favoritos!'
          ),
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
  }

  void _sharePoi() {
    // TODO: Implementar compartilhamento
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Compartilhar - Em breve!')),
    );
  }

  void _openInMaps() {
    // TODO: Implementar abertura em mapas nativos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Abrir no mapa - Em breve!')),
    );
  }

  void _callPhone() {
    if (_poi.telefone != null && _poi.telefone!.isNotEmpty) {
      // TODO: Implementar chamada telefônica
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ligar para ${_poi.telefone}')),
      );
    }
  }

  void _openWebsite() {
    if (_poi.website != null && _poi.website!.isNotEmpty) {
      // TODO: Implementar abertura de website
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Abrir website: ${_poi.website}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar com imagem
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _poi.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              background: Transform.translate(
                offset: Offset(0, _parallaxOffset),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.primaryColor,
                        theme.primaryColor.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              _FavoriteButton(
                poi: _poi,
                onToggle: _toggleFavorite,
              ),
              IconButton(
                onPressed: _sharePoi,
                icon: const Icon(Icons.share, color: Colors.white),
              ),
            ],
          ),

          // Conteúdo
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categoria e preço
                  Row(
                    children: [
                      Chip(
                        label: Text(_poi.categoria),
                        backgroundColor: theme.primaryColor.withOpacity(0.1),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _poi.precoFormatado,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _poi.isGratis ? Colors.green : theme.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Descrição
                  if (_poi.descricao != null && _poi.descricao!.isNotEmpty) ...[
                    Text(
                      'Sobre',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _poi.descricao!,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Informações de localização
                  _buildInfoSection(
                    title: 'Localização',
                    icon: Icons.location_on,
                    children: [
                      Text(
                        _poi.enderecoCompleto,
                        style: theme.textTheme.bodyLarge,
                      ),
                      if (_poi.telefone != null && _poi.telefone!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.phone, size: 16),
                              const SizedBox(width: 8),
                              Text(_poi.telefone!),
                            ],
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Horários
                  if (_poi.horarioAbertura != null || _poi.horarioFecho != null)
                    _buildInfoSection(
                      title: 'Horários',
                      icon: Icons.schedule,
                      children: [
                        if (_poi.horarioAbertura != null)
                          Text('Abertura: ${_poi.horarioAbertura}'),
                        if (_poi.horarioFecho != null)
                          Text('Fecho: ${_poi.horarioFecho}'),
                      ],
                    ),

                  // Facilidades
                  _buildFacilitiesSection(),

                  // Avaliações
                  ReviewsSection(poiId: _poi.id!),

                  // Ações
                  const SizedBox(height: 32),
                  _buildActionsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: theme.primaryColor),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildFacilitiesSection() {
    final facilities = <String, bool>{
      'Acessibilidade': _poi.acessibilidade,
      'Estacionamento': _poi.estacionamento,
      'Casa de banho': _poi.wc,
      'Cafetaria': _poi.cafetaria,
      'Interior': _poi.interior,
      'Exterior': _poi.exterior,
    };

    final availableFacilities = facilities.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (availableFacilities.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        _buildInfoSection(
          title: 'Instalações',
          icon: Icons.info,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: availableFacilities.map((facility) {
                return Chip(
                  label: Text(facility),
                  backgroundColor: Colors.green.withOpacity(0.1),
                  labelStyle: const TextStyle(color: Colors.green),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionsSection() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Ações',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _openInMaps,
                icon: const Icon(Icons.map),
                label: const Text('Ver no Mapa'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            if (_poi.telefone != null && _poi.telefone!.isNotEmpty)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _callPhone,
                  icon: const Icon(Icons.phone),
                  label: const Text('Ligar'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
          ],
        ),
        if (_poi.website != null && _poi.website!.isNotEmpty) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _openWebsite,
            icon: const Icon(Icons.web),
            label: const Text('Visitar Website'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ],
    );
  }
}

class _FavoriteButton extends ConsumerWidget {
  final Poi poi;
  final VoidCallback onToggle;

  const _FavoriteButton({required this.poi, required this.onToggle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double scale = 1.0;
    final isFavoriteStream = ref.watch(favoritesRepositoryProvider).watchIsFavorite(poi.id!);

    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTapDown: (_) {
            setState(() => scale = 1.2);
            HapticFeedback.lightImpact();
          },
          onTapUp: (_) {
            setState(() => scale = 1.0);
            onToggle();
          },
          onTapCancel: () {
            setState(() => scale = 1.0);
          },
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 150),
            child: StreamBuilder<bool>(
              stream: isFavoriteStream,
              builder: (context, snapshot) {
                final isFavorite = snapshot.data ?? false;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.redAccent : Colors.white,
                    size: 28,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
