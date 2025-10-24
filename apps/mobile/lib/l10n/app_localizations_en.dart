// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => '+JUNTOS';

  @override
  String get appSlogan => 'Discover everything you can do with your family, wherever you are.';

  @override
  String get onboardingTitle1 => 'Welcome to +JUNTOS';

  @override
  String get onboardingDesc1 => 'Your digital Pandora\'s box for family activities in Portugal.';

  @override
  String get onboardingTitle2 => 'Children\'s Ages';

  @override
  String get onboardingDesc2 => 'Tell us the ages so we can show suitable activities.';

  @override
  String get onboardingTitle3 => 'Location';

  @override
  String get onboardingDesc3 => 'Allow location access to find nearby activities.';

  @override
  String get continuar => 'Continue';

  @override
  String get comecar => 'Start';

  @override
  String get permitir => 'Allow';

  @override
  String get agora_nao => 'Not now';

  @override
  String get descobrir => 'Discover';

  @override
  String get mapa => 'Map';

  @override
  String get favoritos => 'Favorites';

  @override
  String get perfil => 'Profile';

  @override
  String get perto_de_ti => 'Near you';

  @override
  String get gratis => 'Free';

  @override
  String get interior => 'Indoors';

  @override
  String get exterior => 'Outdoors';

  @override
  String get acessivel => 'Accessible';

  @override
  String get parques => 'Parks';

  @override
  String get museus => 'Museums';

  @override
  String get praias => 'Beaches';

  @override
  String get trilhos => 'Trails';

  @override
  String get teatros => 'Theaters';

  @override
  String get pesquisar => 'Search activities...';

  @override
  String get sem_resultados => 'No results found';

  @override
  String get erro_carregar => 'Error loading data';

  @override
  String get tentar_novamente => 'Try again';

  @override
  String get detalhes => 'Details';

  @override
  String get como_chegar => 'Directions';

  @override
  String get guardar => 'Save';

  @override
  String get partilhar => 'Share';

  @override
  String get avaliar => 'Rate';

  @override
  String get horarios => 'Hours';

  @override
  String get precos => 'Prices';

  @override
  String get contactos => 'Contacts';

  @override
  String get comodidades => 'Amenities';

  @override
  String get estacionamento => 'Parking';

  @override
  String get wc => 'Restroom';

  @override
  String get cafetaria => 'Cafeteria';

  @override
  String get mudaFraldas => 'Diaper changer';

  @override
  String get aberto => 'Open';

  @override
  String get fechado => 'Closed';

  @override
  String aberto_ate(String hora) {
    return 'Open until $hora';
  }

  @override
  String distancia_km(String distancia) {
    return '$distancia km';
  }

  @override
  String idades_anos(int min, int max) {
    return '$min-$max years';
  }

  @override
  String preco_desde(String preco) {
    return 'From $preco€';
  }

  @override
  String shareMessage(String poiName, String poiAddress) {
    return 'Check out what I found on +JUNTOS: $poiName - $poiAddress';
  }
}
