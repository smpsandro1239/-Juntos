// +JUNTOS
// Ficheiro: lib/onboarding/presentation/widgets/location_step.dart
// Descrição: Ecrã do onboarding para inserir o código-postal
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/onboarding_notifier.dart';

class LocationStep extends ConsumerWidget {
  const LocationStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final onboardingNotifier = ref.read(onboardingNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on,
              size: 60,
              color: theme.colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Onde costuma estar?",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Insira o seu código-postal para lhe mostrarmos as atividades mais próximas.",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Código-postal (ex: 1000-001)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              onboardingNotifier.setPostalCode(value);
            },
          ),
        ],
      ),
    );
  }
}
