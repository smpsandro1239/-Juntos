
// +JUNTOS
// Ficheiro: apps/mobile/lib/core/routes/app_router.dart
// Descrição: Configuração das rotas da aplicação
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile/discover/discover_screen.dart';

import 'package:mobile/events/events_screen.dart';

import 'package:mobile/premium/paywall_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DiscoverScreen(),
      ),
      GoRoute(
        path: '/events',
        builder: (context, state) => const EventsScreen(),
      ),
      GoRoute(
        path: '/premium',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );
}
