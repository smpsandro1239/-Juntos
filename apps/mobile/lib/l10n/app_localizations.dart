import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
    Locale('pt', 'PT')
  ];

  /// Application Title
  ///
  /// In en, this message translates to:
  /// **'+JUNTOS'**
  String get appTitle;

  /// Application Slogan
  ///
  /// In en, this message translates to:
  /// **'Discover everything you can do with your family, wherever you are.'**
  String get appSlogan;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to +JUNTOS'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Your digital Pandora\'s box for family activities in Portugal.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Children\'s Ages'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Tell us the ages so we can show suitable activities.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Allow location access to find nearby activities.'**
  String get onboardingDesc3;

  /// No description provided for @continuar.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuar;

  /// No description provided for @comecar.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get comecar;

  /// No description provided for @permitir.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get permitir;

  /// No description provided for @agora_nao.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get agora_nao;

  /// No description provided for @descobrir.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get descobrir;

  /// No description provided for @mapa.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get mapa;

  /// No description provided for @favoritos.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritos;

  /// No description provided for @perfil.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get perfil;

  /// No description provided for @perto_de_ti.
  ///
  /// In en, this message translates to:
  /// **'Near you'**
  String get perto_de_ti;

  /// No description provided for @gratis.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get gratis;

  /// No description provided for @interior.
  ///
  /// In en, this message translates to:
  /// **'Indoors'**
  String get interior;

  /// No description provided for @exterior.
  ///
  /// In en, this message translates to:
  /// **'Outdoors'**
  String get exterior;

  /// No description provided for @acessivel.
  ///
  /// In en, this message translates to:
  /// **'Accessible'**
  String get acessivel;

  /// No description provided for @parques.
  ///
  /// In en, this message translates to:
  /// **'Parks'**
  String get parques;

  /// No description provided for @museus.
  ///
  /// In en, this message translates to:
  /// **'Museums'**
  String get museus;

  /// No description provided for @praias.
  ///
  /// In en, this message translates to:
  /// **'Beaches'**
  String get praias;

  /// No description provided for @trilhos.
  ///
  /// In en, this message translates to:
  /// **'Trails'**
  String get trilhos;

  /// No description provided for @teatros.
  ///
  /// In en, this message translates to:
  /// **'Theaters'**
  String get teatros;

  /// No description provided for @pesquisar.
  ///
  /// In en, this message translates to:
  /// **'Search activities...'**
  String get pesquisar;

  /// No description provided for @sem_resultados.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get sem_resultados;

  /// No description provided for @erro_carregar.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get erro_carregar;

  /// No description provided for @tentar_novamente.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tentar_novamente;

  /// No description provided for @detalhes.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detalhes;

  /// No description provided for @como_chegar.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get como_chegar;

  /// No description provided for @guardar.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get guardar;

  /// No description provided for @partilhar.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get partilhar;

  /// No description provided for @avaliar.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get avaliar;

  /// No description provided for @horarios.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get horarios;

  /// No description provided for @precos.
  ///
  /// In en, this message translates to:
  /// **'Prices'**
  String get precos;

  /// No description provided for @contactos.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contactos;

  /// No description provided for @comodidades.
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get comodidades;

  /// No description provided for @estacionamento.
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get estacionamento;

  /// No description provided for @wc.
  ///
  /// In en, this message translates to:
  /// **'Restroom'**
  String get wc;

  /// No description provided for @cafetaria.
  ///
  /// In en, this message translates to:
  /// **'Cafeteria'**
  String get cafetaria;

  /// No description provided for @mudaFraldas.
  ///
  /// In en, this message translates to:
  /// **'Diaper changer'**
  String get mudaFraldas;

  /// No description provided for @aberto.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get aberto;

  /// No description provided for @fechado.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get fechado;

  /// No description provided for @aberto_ate.
  ///
  /// In en, this message translates to:
  /// **'Open until {hora}'**
  String aberto_ate(String hora);

  /// No description provided for @distancia_km.
  ///
  /// In en, this message translates to:
  /// **'{distancia} km'**
  String distancia_km(String distancia);

  /// No description provided for @idades_anos.
  ///
  /// In en, this message translates to:
  /// **'{min}-{max} years'**
  String idades_anos(int min, int max);

  /// No description provided for @preco_desde.
  ///
  /// In en, this message translates to:
  /// **'From {preco}€'**
  String preco_desde(String preco);

  /// The message to share with a friend
  ///
  /// In en, this message translates to:
  /// **'Check out what I found on +JUNTOS: {poiName} - {poiAddress}'**
  String shareMessage(String poiName, String poiAddress);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'PT': return AppLocalizationsPtPt();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
