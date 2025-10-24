// +JUNTOS
// Ficheiro: lib/onboarding/presentation/widgets/ages_step.dart
// Descrição: Ecrã do onboarding para selecionar as idades
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';

class AgesStep extends ConsumerWidget {
  const AgesStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final onboardingNotifier = ref.read(onboardingNotifierProvider.notifier);

    final List<String> ageRanges = [
      '0-2 anos',
      '3-5 anos',
      '6-8 anos',
      '9-12 anos',
    ];

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
          const SizedBox(height: 24),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: ageRanges.map((range) {
              final isSelected = onboardingState.ageRanges.contains(range);
              return ChoiceChip(
                label: Text(range),
                selected: isSelected,
                onSelected: (selected) {
                  final newSelection = Set<String>.from(onboardingState.ageRanges);
                  if (selected) {
                    newSelection.add(range);
                  } else {
                    newSelection.remove(range);
                  }
                  onboardingNotifier.setAgeRanges(newSelection);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
