// +JUNTOS
// Ficheiro: lib/main.dart
// Descrição: Entry point da aplicação Flutter
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';
import 'core/providers/shared_preferences_provider.dart';
import 'core/providers/privacy_provider.dart';

import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  // Garantir que os bindings estão inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Carregar variáveis de ambiente
  await dotenv.load(fileName: ".env");

  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configurar Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Inicializar SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Criar um container de providers para aceder aos serviços antes da app arrancar
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
  );

  // Gerir consentimento de privacidade
  final privacyService = container.read(privacyConsentServiceProvider);
  await privacyService.incrementSessionCount();
  await privacyService.checkAndRequestConsent();

  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      UncontrolledProviderScope(
        container: container,
        child: const JuntosApp(),
      ),
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
      
      // Navegação
      routerConfig: router,
    );
  }
}
