// +JUNTOS
// Ficheiro: lib/core/providers/api_provider.dart
// Descrição: Providers do Riverpod para serviços da API
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/poi_service.dart';
import '../../data/local/database/app_database.dart';
import '../../data/local/daos/favorites_dao.dart';
import '../../data/repositories/favorites_repository.dart';
import '../network/api_client.dart';

// Provider do cliente API
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

// Provider do serviço de autenticação
final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthService(apiClient);
});

// Provider do serviço de POIs
final poiServiceProvider = Provider<PoiService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PoiService(apiClient);
});

// Provider para banco de dados local
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Provider para o DAO de favoritos
final favoritesDaoProvider = Provider<FavoritesDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return database.favoritesDao;
});

final clickHistoryDaoProvider = Provider<ClickHistoryDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return database.clickHistoryDao;
});

final cachedPoisDaoProvider = Provider<CachedPoisDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return database.cachedPoisDao;
});

final essentialPoisDaoProvider = Provider<EssentialPoisDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return database.essentialPoisDao;
});

// Provider para repositório de favoritos
final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  final favoritesDao = ref.watch(favoritesDaoProvider);
  return FavoritesRepository(favoritesDao);
});

// Provider para estado de autenticação
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthStateNotifier(authService);
});

// Estado de autenticação
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Notifier para gerenciar estado de autenticação
class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthStateNotifier(this._authService) : super(const AuthState()) {
    // Verificar se já está autenticado ao inicializar
    _checkAuthStatus();
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _authService.login(email: email, password: password);
      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> register({
    required String nome,
    required String email,
    required String password,
    String? telefone,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _authService.register(
        nome: nome,
        email: email,
        password: password,
        telefone: telefone,
      );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void logout() {
    _authService.logout();
    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  void _checkAuthStatus() {
    final isAuthenticated = _authService.isAuthenticated();
    state = state.copyWith(isAuthenticated: isAuthenticated);
  }
}
