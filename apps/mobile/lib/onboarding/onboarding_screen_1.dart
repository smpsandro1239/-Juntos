// +JUNTOS
// Ficheiro: apps/mobile/lib/onboarding/onboarding_screen_1.dart
// Descrição: Primeiro ecrã do processo de onboarding - Idade dos filhos
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/onboarding_provider.dart';

class OnboardingScreen1 extends ConsumerStatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  ConsumerState<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends ConsumerState<OnboardingScreen1> {
  // Estado local para as idades selecionadas
  final Set<String> _selectedAges = {};

  final List<String> _ageRanges = [
    '0-2 anos',
    '3-5 anos',
    '6-8 anos',
    '9-12 anos',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: Usar l10n para os textos
    // final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Título e Subtítulo
              Text(
                'Para que idades procuras atividades?',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Seleciona uma ou mais opções. Isto ajuda-nos a personalizar as sugestões para a tua família.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // 2. Seleção de Idades
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12.0,
                runSpacing: 12.0,
                children: _ageRanges.map((ageRange) {
                  final isSelected = _selectedAges.contains(ageRange);
                  return ChoiceChip(
                    label: Text(ageRange),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedAges.add(ageRange);
                        } else {
                          _selectedAges.remove(ageRange);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const Spacer(),

              // 3. Botões de Ação
              ElevatedButton(
                onPressed: _selectedAges.isNotEmpty ? () {
                  ref.read(onboardingNotifierProvider.notifier).setAgeRanges(_selectedAges);
                  context.go('/onboarding/2');
                } : null, // Desativado se nenhuma idade for selecionada
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: theme.textTheme.titleMedium,
                ),
                child: const Text('Continuar'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  ref.read(onboardingNotifierProvider.notifier).enterGuestMode();
                  context.go('/home');
                },
                child: const Text('Experimentar mais tarde'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
