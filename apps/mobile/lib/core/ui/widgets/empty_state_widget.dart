// +JUNTOS
// Ficheiro: lib/core/ui/widgets/empty_state_widget.dart
// Descrição: Widget reutilizável para mostrar "empty states" com uma animação Lottie
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  final String lottieAsset;
  final String message;
  final VoidCallback? onRetry;

  const EmptyStateWidget({
    super.key,
    required this.lottieAsset,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              lottieAsset,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Tentar Novamente'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
