// +JUNTOS
// Ficheiro: lib/core/router/app_router.dart
// Descrição: Configuração de rotas da aplicação
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../discover/presentation/discover_screen.dart';
import '../../discover/presentation/details/poi_details_screen.dart';
import '../../discover/presentation/map/map_screen.dart';
import '../../favorites/presentation/favorites_screen.dart';
import '../../onboarding/onboarding_screen_1.dart';
import '../../onboarding/onboarding_screen_2.dart';
import '../../onboarding/onboarding_screen_3.dart';
import '../presentation/splash_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
       GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen1(),
      ),
       GoRoute(
        path: '/onboarding/2',
        name: 'onboarding2',
        builder: (context, state) => const OnboardingScreen2(),
      ),
       GoRoute(
        path: '/onboarding/3',
        name: 'onboarding3',
        builder: (context, state) => const OnboardingScreen3(),
      ),
      GoRoute(
        path: '/discover',
        name: 'discover',
        builder: (context, state) => const DiscoverScreen(),
      ),
      GoRoute(
        path: '/poi/:id',
        name: 'poi_details',
        builder: (context, state) {
          final poiId = int.tryParse(state.pathParameters['id'] ?? '');
          // TODO: Carregar POI por ID ou passar via extra
          return const DiscoverScreen(); // Placeholder
        },
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const DiscoverScreen(),
          ),
          GoRoute(
            path: '/map',
            name: 'map',
            builder: (context, state) => const MapScreen(),
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const Scaffold(
              body: Center(child: Text('Perfil - Em breve')),
            ),
          ),
        ],
      ),
    ],
  );
}

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Descobrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    switch (location) {
      case '/home':
        return 0;
      case '/map':
        return 1;
      case '/favorites':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/map');
        break;
      case 2:
        context.go('/favorites');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }
}
