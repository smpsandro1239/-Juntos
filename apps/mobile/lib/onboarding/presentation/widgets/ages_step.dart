// +JUNTOS
// Ficheiro: lib/onboarding/presentation/widgets/ages_step.dart
// Descrição: Ecrã do onboarding para selecionar as idades
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';

class AgesStep extends StatelessWidget {
  const AgesStep({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.child_care,
              size: 60,
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Para quem são as atividades?",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Selecione as faixas etárias dos seus filhos para personalizarmos as sugestões.",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          // TODO: Adicionar a UI para selecionar as idades
        ],
      ),
    );
  }
}
