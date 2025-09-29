
// +JUNTOS
// Ficheiro: apps/mobile/lib/onboarding/onboarding_screen_2.dart
// Descrição: Segundo ecrã do processo de onboarding
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Para uma melhor experiência, indique as idades das crianças.'),
            // Adicionar campos para as idades
            ElevatedButton(
              onPressed: () {
                // Navegar para o próximo ecrã
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
