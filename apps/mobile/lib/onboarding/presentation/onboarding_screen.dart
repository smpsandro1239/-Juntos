// +JUNTOS
// Ficheiro: lib/onboarding/presentation/onboarding_screen.dart
// Descrição: Ecrã de onboarding da aplicação
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/onboarding_notifier.dart';
import 'widgets/welcome_step.dart';
import 'widgets/ages_step.dart';
import 'widgets/location_step.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);

    // Lógica para desativar o botão
    bool isNextDisabled = (_currentPage == 1 && onboardingState.ageRanges.isEmpty);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => context.go('/home'),
            child: const Text('Experimentar mais tarde'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: const [
                  WelcomeStep(),
                  AgesStep(),
                  LocationStep(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: isNextDisabled ? null : _onNextPressed,
                      child: Text(
                        _currentPage == 2 ? "Começar" : "Continuar",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onNextPressed() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ref.read(onboardingNotifierProvider.notifier).completeOnboarding();
      context.go('/home');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
