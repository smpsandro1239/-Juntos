// +JUNTOS
// Ficheiro: lib/core/presentation/splash_screen.dart
// Descrição: Ecrã de carregamento inicial que decide a rota a seguir
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/onboarding/providers/onboarding_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool>>(onboardingCompletedProvider, (_, state) {
      state.when(
        data: (isCompleted) {
          if (isCompleted) {
            context.go('/home');
          } else {
            context.go('/onboarding');
          }
        },
        loading: () {},
        error: (err, stack) {
          // Em caso de erro, ir para o onboarding como fallback seguro
          context.go('/onboarding');
        },
      );
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
