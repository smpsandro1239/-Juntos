
// +JUNTOS
// Ficheiro: apps/mobile/lib/discover/discover_screen.dart
// Descrição: Ecrã de descoberta de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:mobile/l10n/app_localizations.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.discoverTitle),
      ),
      body: const Center(
        child: Text('Ecrã de Descoberta'),
      ),
    );
  }
}
