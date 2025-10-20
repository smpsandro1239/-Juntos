// +JUNTOS
// Ficheiro: apps/mobile/lib/onboarding/onboarding_screen_3.dart
// Descrição: Terceiro ecrã do processo de onboarding - Conclusão
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen3 extends ConsumerWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // TODO: Usar l10n para os textos
    // final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. Animação de Sucesso
              Lottie.asset(
                'assets/lottie/onboarding_complete.json',
                width: 250,
                height: 250,
                // Placeholder em caso de erro
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.celebration,
                    size: 150,
                    color: Colors.amber,
                  );
                },
              ),
              const SizedBox(height: 48),

              // 2. Título e Subtítulo
              Text(
                'Tudo a postos!',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'A tua experiência foi personalizada. Prepara-te para descobrir atividades incríveis em família.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const Spacer(),
              const Spacer(),

              // 3. Botão de Ação
              ElevatedButton(
                onPressed: () {
                  // TODO: Marcar o onboarding como concluído
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: theme.textTheme.titleMedium,
                ),
                child: const Text('Começar a Descobrir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
