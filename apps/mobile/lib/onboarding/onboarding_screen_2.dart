// +JUNTOS
// Ficheiro: apps/mobile/lib/onboarding/onboarding_screen_2.dart
// Descrição: Segundo ecrã do processo de onboarding - Código-postal
// Autor: Jules
// Locale: pt_PT

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/onboarding_provider.dart';

class OnboardingScreen2 extends ConsumerStatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  ConsumerState<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends ConsumerState<OnboardingScreen2> {
  final _formKey = GlobalKey<FormState>();
  final _postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: Usar l10n para os textos
    // final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        // Adiciona um botão de voltar para o ecrã anterior
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Título e Subtítulo
                Text(
                  'Onde procuras atividades?',
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'O teu código-postal ajuda-nos a mostrar o que está mais perto de ti. Não te preocupes, não partilhamos a tua localização exata.',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // 2. Campo de Código-Postal
                TextFormField(
                  controller: _postalCodeController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                  decoration: const InputDecoration(
                    hintText: 'XXXX-XXX',
                  ),
                  // TODO: Adicionar um InputFormatter para o formato do código-postal
                  validator: (value) {
                    // TODO: Implementar validação do código-postal (e.g., regex)
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduz um código-postal';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    // TODO: Implementar fluxo para ajudar o utilizador a encontrar o código-postal
                  },
                  child: const Text('Não sei o meu código-postal'),
                ),

                const Spacer(),

                // 3. Botões de Ação
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(onboardingNotifierProvider.notifier).setPostalCode(_postalCodeController.text);
                      context.go('/onboarding/3');
                    }
                  },
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
      ),
    );
  }

  @override
  void dispose() {
    _postalCodeController.dispose();
    super.dispose();
  }
}
