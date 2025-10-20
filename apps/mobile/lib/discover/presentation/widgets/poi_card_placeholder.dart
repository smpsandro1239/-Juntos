// +JUNTOS
// Ficheiro: lib/discover/presentation/widgets/poi_card_placeholder.dart
// Descrição: Widget de placeholder com efeito shimmer para o cartão de POI
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PoiCardPlaceholder extends StatelessWidget {
  const PoiCardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 14,
                      color: Colors.white,
                    ),
                     const SizedBox(height: 4),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
