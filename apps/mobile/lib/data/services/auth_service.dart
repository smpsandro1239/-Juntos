// +JUNTOS
// Ficheiro: lib/data/services/auth_service.dart
// Descrição: Serviço para operações de autenticação
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:dio/dio.dart';
import '../models/auth.dart';
import '../models/user.dart';
import '../../core/network/api_client.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  // Login de utilizador
  Future<JwtResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginRequest(email: email, password: password);

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/v1/auth/login',
        data: request.toJson(),
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Resposta vazia do servidor');
      }

      final jwtResponse = JwtResponse.fromJson(data);

      // Armazenar token no cliente
      _apiClient.setToken(jwtResponse.accessToken);

      return jwtResponse;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Registo de novo utilizador
  Future<MessageResponse> register({
    required String nome,
    required String email,
    required String password,
    String? telefone,
  }) async {
    try {
      final request = SignupRequest(
        nome: nome,
        email: email,
        password: password,
        telefone: telefone,
      );

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/v1/auth/register',
        data: request.toJson(),
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Resposta vazia do servidor');
      }

      return MessageResponse.fromJson(data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Validar token JWT
  Future<MessageResponse> validateToken() async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/v1/auth/validate',
      );

      final data = response.data;
      if (data == null) {
        throw Exception('Resposta vazia do servidor');
      }

      return MessageResponse.fromJson(data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Logout - limpar token
  void logout() {
    _apiClient.clearToken();
  }

  // Verificar se está autenticado
  bool isAuthenticated() {
    // TODO: Implementar verificação real do token
    return false;
  }

  // Tratamento de erros
  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Erro de conexão. Verifique sua internet.');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Erro desconhecido';

        switch (statusCode) {
          case 400:
            return Exception('Dados inválidos: $message');
          case 401:
            return Exception('Credenciais inválidas.');
          case 403:
            return Exception('Acesso negado.');
          case 409:
            return Exception('Email já registado.');
          case 500:
            return Exception('Erro interno do servidor.');
          default:
            return Exception('Erro $statusCode: $message');
        }

      case DioExceptionType.cancel:
        return Exception('Operação cancelada.');

      default:
        return Exception('Erro inesperado: ${error.message}');
    }
  }
}
