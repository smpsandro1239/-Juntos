
// +JUNTOS
// Ficheiro: apps/mobile/lib/events/events_screen.dart
// Descrição: Ecrã para visualização de eventos
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: const Center(
        child: Text('Ecrã de Eventos'),
      ),
    );
  }
}
