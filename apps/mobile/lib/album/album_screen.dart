
// +JUNTOS
// Ficheiro: apps/mobile/lib/album/album_screen.dart
// Descrição: Ecrã para visualização de um album
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album'),
      ),
      body: const Center(
        child: Text('Ecrã do Album'),
      ),
    );
  }
}
