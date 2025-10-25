// +JUNTOS
// Ficheiro: lib/discover/presentation/widgets/partner_ad_card.dart
// Descrição: Widget para mostrar um card de anúncio de um parceiro
// Autor: (O teu nome)
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/providers/services_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnerAdCard extends ConsumerWidget {
  const PartnerAdCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    const partnerName = 'FNAC';
    const partnerUrl = 'https://www.fnac.pt/livros-infantis-e-juvenis';
    const utmSource = 'utm_source=juntos_app';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: theme.colorScheme.secondaryContainer.withOpacity(0.5),
      child: InkWell(
        onTap: () async {
          // Analytics
          ref.read(analyticsServiceProvider).logPartnerTap(partnerName);

          final url = Uri.parse('$partnerUrl?$utmSource');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage('https://yt3.googleusercontent.com/ytc/AIdro_kO3G9-3g10_ac4a_9i3-Jk-n5__RR-y-J_Rx-k-w=s900-c-k-c0x00ffffff-no-rj'), // Logótipo da FNAC
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FNAC Kids',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Descobre um mundo de livros e jogos para os mais pequenos.',
                      style: theme.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.onSecondaryContainer),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Anúncio',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
