
// +JUNTOS
// Ficheiro: apps/mobile/lib/onboarding/onboarding_screen_3.dart
// Descrição: Terceiro ecrã do processo de onboarding
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quais são os vossos interesses?'),
            // Adicionar opções de interesses
            ElevatedButton(
              onPressed: () {
                // Navegar para o ecrã principal
              },
              child: const Text('Concluir'),
            ),
          ],
        ),
      ),
    );
  }
}
