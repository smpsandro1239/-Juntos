
// +JUNTOS
// Ficheiro: apps/mobile/lib/onboarding/onboarding_screen_1.dart
// Descrição: Primeiro ecrã do processo de onboarding
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem-vindo ao +JUNTOS!'),
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
