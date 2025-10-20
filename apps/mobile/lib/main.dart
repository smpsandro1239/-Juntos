// +JUNTOS
// Ficheiro: lib/main.dart
// Descrição: Entry point da aplicação Flutter
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/app_lifecycle_service.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  // Garantir que os bindings estão inicializados antes de chamar código nativo
  WidgetsFlutterBinding.ensureInitialized();

  // Gerir o arranque da sessão (e.g., pedido de ATT)
  final prefs = await SharedPreferences.getInstance();
  final appLifecycleService = AppLifecycleService(prefs);
  await appLifecycleService.handleSessionStart();

  runApp(
    ProviderScope(
      overrides: [
        // Se precisarmos do SharedPreferences noutros locais, podemos fornecê-lo aqui
        // sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const JuntosApp(),
    ),
  );
}

class JuntosApp extends ConsumerWidget {
  const JuntosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: '+JUNTOS',
      debugShowCheckedModeBanner: false,
      
      // Tema
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      
      // Localização
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'PT'), // Português Portugal (default)
        Locale('en', 'US'), // Inglês
        Locale('fr', 'FR'), // Francês
        Locale('es', 'ES'), // Espanhol
      ],
      locale: const Locale('pt', 'PT'),
      
      // Navegação
      routerConfig: router,
    );
  }
}