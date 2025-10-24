// +JUNTOS
// Ficheiro: lib/discover/presentation/details/widgets/add_review_dialog.dart
// Descrição: Diálogo para adicionar uma nova avaliação
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../data/local/database/app_database.dart';
import '../../../../core/providers/api_provider.dart';

class AddReviewDialog extends ConsumerStatefulWidget {
  final int poiId;

  const AddReviewDialog({super.key, required this.poiId});

  @override
  ConsumerState<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends ConsumerState<AddReviewDialog> {
  int _rating = 0;
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Avaliação'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () => setState(() => _rating = index + 1),
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
              );
            }),
          ),
          TextField(
            controller: _commentController,
            decoration: const InputDecoration(
              labelText: 'Comentário (opcional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _rating > 0 ? _submitReview : null,
          child: const Text('Submeter'),
        ),
      ],
    );
  }

  Future<void> _submitReview() async {
    final reviewsDao = ref.read(appDatabaseProvider).reviewsDao;

    final newReview = ReviewsCompanion(
      poiId: drift.Value(widget.poiId),
      rating: drift.Value(_rating),
      comment: drift.Value(_commentController.text),
    );

    await reviewsDao.addReview(newReview);

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Avaliação adicionada com sucesso!')),
      );
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
