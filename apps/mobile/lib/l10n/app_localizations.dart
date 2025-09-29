
// +JUNTOS
// Ficheiro: apps/mobile/lib/l10n/app_localizations.dart
// Descrição: Lógica de localização da aplicação
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_pt.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt', 'PT'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'+JUNTOS'**
  String get appTitle;

  /// No description provided for @discoverTitle.
  ///
  /// In pt, this message translates to:
  /// **'Descobrir'**
  String get discoverTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(getTranslation(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations getTranslation(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
    default:
      return AppLocalizationsPt();
  }
}
