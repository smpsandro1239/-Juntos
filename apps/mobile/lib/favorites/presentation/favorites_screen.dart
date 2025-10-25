// +JUNTOS
// Ficheiro: lib/favorites/presentation/favorites_screen.dart
// Descrição: Tela de favoritos locais
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package.flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/api_provider.dart';
import '../../core/ui/widgets/empty_state_widget.dart';
import '../../discover/presentation/details/poi_details_screen.dart';
import '../../data/models/poi.dart';
import '../../data/local/database/app_database.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesRepository = ref.watch(favoritesRepositoryProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: StreamBuilder<List<Favorite>>(
        stream: favoritesRepository.watchAllFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final favorites = snapshot.data ?? [];

          if (favorites.isEmpty) {
            return const EmptyStateWidget(
              lottieAsset: 'assets/lottie/empty_box.json',
              message: 'Ainda não adicionaste nenhuma atividade aos teus favoritos.',
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final favorite = favorites[index];
              return _buildFavoriteCard(context, ref, favorite);
            },
          );
        },
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, WidgetRef ref, Favorite favorite) {
    final poi = _favoriteToPoi(favorite);

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
              // ... (restante da UI do card)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(poi.nome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(poi.categoria, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(favoritesRepositoryProvider).toggleFavorite(poi);
                },
                icon: const Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Poi _favoriteToPoi(Favorite favorite) {
    return Poi(
      id: favorite.poiId,
      nome: favorite.nome,
      descricao: favorite.descricao,
      categoria: favorite.categoria,
      idadeMin: favorite.idadeMin,
      idadeMax: favorite.idadeMax,
      precoMin: favorite.precoMin,
      precoMax: favorite.precoMax,
      latitude: favorite.latitude,
      longitude: favorite.longitude,
      morada: favorite.morada,
      codigoPostal: favorite.codigoPostal,
      cidade: favorite.cidade,
      distrito: favorite.distrito,
      telefone: favorite.telefone,
      website: favorite.website,
      email: favorite.email,
      horarioAbertura: favorite.horarioAbertura,
      horarioFecho: favorite.horarioFecho,
      acessibilidade: favorite.acessibilidade,
      estacionamento: favorite.estacionamento,
      wc: favorite.wc,
      cafetaria: favorite.cafetaria,
      interior: favorite.interior,
      exterior: favorite.exterior,
      ativo: favorite.ativo,
    );
  }
}
