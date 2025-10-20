// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => '+JUNTOS';

  @override
  String get pesquisar => 'Pesquisar...';

  @override
  String get gratis => 'Grátis';

  @override
  String get interior => 'Interior';

  @override
  String get exterior => 'Exterior';

  @override
  String get acessivel => 'Acessível';

  @override
  String get parques => 'Parques';

  @override
  String get museus => 'Museus';

  @override
  String get praias => 'Praias';

  @override
  String get trilhos => 'Trilhos';

  @override
  String get teatros => 'Teatros';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt(): super('pt_PT');

  @override
  String get appTitle => '+JUNTOS';

  @override
  String get pesquisar => 'Pesquisar atividades...';

  @override
  String get gratis => 'Grátis';

  @override
  String get interior => 'Interior';

  @override
  String get exterior => 'Exterior';

  @override
  String get acessivel => 'Acessível';

  @override
  String get parques => 'Parques';

  @override
  String get museus => 'Museus';

  @override
  String get praias => 'Praias';

  @override
  String get trilhos => 'Trilhos';

  @override
  String get teatros => 'Teatros';
}
