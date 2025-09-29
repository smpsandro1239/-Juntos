
// +JUNTOS
// Ficheiro: apps/mobile/lib/main.dart
// Descrição: Entry point da aplicação Flutter
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/l10n/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: '+JUNTOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'PT'),
        Locale('en', ''),
        Locale('fr', ''),
        Locale('es', ''),
      ],
    );
  }
}
