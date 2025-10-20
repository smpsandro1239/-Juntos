// +JUNTOS
// Ficheiro: lib/data/models/partner_ad.dart
// Descrição: Modelo de dados para um anúncio de parceiro
// Autor: Jules
// Locale: pt_PT

class PartnerAd {
  final String title;
  final String imageUrl;
  final String destinationUrl;

  const PartnerAd({
    required this.title,
    required this.imageUrl,
    required this.destinationUrl,
  });

  // Dados mockados para a demonstração
  static const mockAd = PartnerAd(
    title: 'Descobre os melhores brinquedos na Imaginarium!',
    imageUrl: 'https://via.placeholder.com/800x600.png/FF6F00/FFFFFF?text=Imaginarium',
    destinationUrl: 'https://www.imaginarium.pt',
  );
}
