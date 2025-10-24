// +JUNTOS
// Ficheiro: lib/discover/presentation/details/widgets/reviews_section.dart
// Descrição: Widget para exibir e gerir avaliações de um POI
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/local/database/app_database.dart';
import '../../../../core/providers/api_provider.dart';
import 'add_review_dialog.dart';

class ReviewsSection extends ConsumerStatefulWidget {
  final int poiId;

  const ReviewsSection({super.key, required this.poiId});

  @override
  ConsumerState<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends ConsumerState<ReviewsSection> {
  // Key para forçar o FutureBuilder a recarregar
  final _futureKey = GlobalKey();

  void _showAddReviewDialog() {
    showDialog(
      context: context,
      builder: (context) => AddReviewDialog(poiId: widget.poiId),
    ).then((_) {
      // Força o FutureBuilder a recarregar quando o diálogo é fechado
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final reviewsDao = ref.watch(appDatabaseProvider).reviewsDao;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Avaliações',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton.icon(
              onPressed: _showAddReviewDialog,
              icon: const Icon(Icons.add_comment_outlined),
              label: const Text('Adicionar'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        FutureBuilder<List<Review>>(
          key: _futureKey, // Usar a key para permitir o refresh
          future: reviewsDao.getReviewsForPoi(widget.poiId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Text('Erro ao carregar avaliações.');
            }

            final reviews = snapshot.data ?? [];

            if (reviews.isEmpty) {
              return const Text('Ainda não existem avaliações. Sê o primeiro a avaliar!');
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(review.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Row(
                              children: List.generate(5, (i) => Icon(
                                i < review.rating ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 16,
                              )),
                            ),
                          ],
                        ),
                        if (review.comment != null && review.comment!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(review.comment!),
                        ]
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
