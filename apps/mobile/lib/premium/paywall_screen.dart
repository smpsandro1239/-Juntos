
// +JUNTOS
// Ficheiro: apps/mobile/lib/premium/paywall_screen.dart
// Descrição: Ecrã de paywall para subscrição premium
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seja Premium'),
      ),
      body: const Center(
        child: Text('Ecrã de Paywall'),
      ),
    );
  }
}
