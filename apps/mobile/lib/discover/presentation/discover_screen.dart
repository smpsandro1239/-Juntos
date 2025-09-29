// +JUNTOS
// Ficheiro: lib/discover/presentation/discover_screen.dart
// Descrição: Ecrã principal de descoberta de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

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
              onChanged: (value) {
                // TODO: Implementar pesquisa
              },
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
                _buildCategoryCard(l10n.parques, Icons.playground_outlined, Colors.green),
                _buildCategoryCard(l10n.museus, Icons.museum_outlined, Colors.purple),
                _buildCategoryCard(l10n.praias, Icons.beach_access_outlined, Colors.blue),
                _buildCategoryCard(l10n.trilhos, Icons.hiking_outlined, Colors.brown),
                _buildCategoryCard(l10n.teatros, Icons.theater_comedy_outlined, Colors.red),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Lista de POIs próximos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 5, // Mock data
              itemBuilder: (context, index) => _buildPoiCard(
                nome: 'Parque Infantil ${index + 1}',
                descricao: 'Parque com equipamentos para várias idades',
                distancia: '${(index + 1) * 0.5} km',
                preco: index == 0 ? 'Grátis' : '${(index + 1) * 2}€',
                categoria: 'Parque',
              ),
            ),
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

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        child: InkWell(
          onTap: () {
            // TODO: Navegar para categoria
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

  Widget _buildPoiCard({
    required String nome,
    required String descricao,
    required String distancia,
    required String preco,
    required String categoria,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // TODO: Navegar para detalhes
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
                      nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      descricao,
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
                        Text(distancia, style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 12),
                        Icon(Icons.euro, size: 16, color: Colors.grey[600]),
                        Text(preco, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Adicionar aos favoritos
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