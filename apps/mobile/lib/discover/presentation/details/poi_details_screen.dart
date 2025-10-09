// +JUNTOS
// Ficheiro: lib/discover/presentation/details/poi_details_screen.dart
// Descrição: Tela de detalhes completa de um POI
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/models/poi.dart';
import '../../../core/providers/api_provider.dart';

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

  @override
  void initState() {
    super.initState();
    _poi = widget.poi;
    _loadFullPoiDetails();
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

    try {
      final isNowFavorite = await favoritesRepository.toggleFavorite(_poi);

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
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
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
              background: Container(
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
            actions: [
              StreamBuilder<bool>(
                stream: ref.watch(favoritesRepositoryProvider).watchIsFavorite(_poi.id!),
                builder: (context, snapshot) {
                  final isFavorite = snapshot.data ?? false;
                  return IconButton(
                    onPressed: _toggleFavorite,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  );
                },
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
