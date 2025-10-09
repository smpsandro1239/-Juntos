// +JUNTOS
// Ficheiro: lib/core/network/api_client.dart
// Descrição: Cliente HTTP configurado com Dio
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static const String _baseUrl = kDebugMode
      ? 'http://10.0.2.2:8080'  // Android emulator
      : 'http://localhost:8080'; // Production

  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Interceptors para logging e tratamento de erros
    _dio.interceptors.addAll([
      LogInterceptor(
        request: kDebugMode,
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseHeader: false,
        responseBody: kDebugMode,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Adicionar token JWT se existir
          final token = _getStoredToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Tratamento global de erros
          if (error.response?.statusCode == 401) {
            // Token expirado - logout automático
            _handleUnauthorized();
          }
          return handler.next(error);
        },
      ),
    ]);
  }

  Dio get dio => _dio;

  // Métodos de conveniência para requests
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  // Métodos para gestão de token
  void setToken(String token) {
    // TODO: Implementar armazenamento seguro do token
    // Por agora, armazenar em memória
    _storedToken = token;
  }

  void clearToken() {
    _storedToken = null;
    // TODO: Limpar token do armazenamento seguro
  }

  String? _storedToken;

  String? _getStoredToken() {
    // TODO: Implementar leitura do armazenamento seguro
    return _storedToken;
  }

  void _handleUnauthorized() {
    clearToken();
    // TODO: Implementar navegação para tela de login
    debugPrint('Token expirado - redirecionar para login');
  }
}
