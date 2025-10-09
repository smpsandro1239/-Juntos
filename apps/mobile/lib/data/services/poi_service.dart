// +JUNTOS
// Ficheiro: lib/data/services/poi_service.dart
// Descrição: Serviço para operações com POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import 'package:dio/dio.dart';
import '../models/poi.dart';
import '../../core/network/api_client.dart';

class PoiService {
  final ApiClient _apiClient;

  PoiService(this._apiClient);

  // Buscar POIs próximos por localização e idade
  Future<List<Poi>> findNearby({
    required double latitude,
    required double longitude,
    int raio = 5000,
    int idadeMin = 0,
    int idadeMax = 12,
    int limite = 20,
  }) async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        '/v1/pois',
        queryParameters: {
          'lat': latitude,
          'lng': longitude,
          'raio': raio,
          'idadeMin': idadeMin,
          'idadeMax': idadeMax,
          'limite': limite,
        },
      );

      final data = response.data;
      if (data == null) return [];

      return data.map((json) => Poi.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Pesquisar POIs por termo
  Future<List<Poi>> search({
    required String query,
    int limite = 20,
  }) async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        '/v1/pois/search',
        queryParameters: {
          'q': query,
          'limite': limite,
        },
      );

      final data = response.data;
      if (data == null) return [];

      return data.map((json) => Poi.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Buscar POI por ID
  Future<Poi?> findById(int id) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/v1/pois/$id',
      );

      final data = response.data;
      if (data == null) return null;

      return Poi.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw _handleError(e);
    }
  }

  // Buscar POIs por categoria
  Future<List<Poi>> findByCategory(String categoria) async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        '/v1/pois/categoria/$categoria',
      );

      final data = response.data;
      if (data == null) return [];

      return data.map((json) => Poi.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Obter estatísticas dos POIs
  Future<Map<String, dynamic>> getStats() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/v1/pois/stats',
      );

      return response.data ?? {};
    } on DioException catch (e) {
      throw _handleError(e);
    }
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
            return Exception('Não autorizado. Faça login novamente.');
          case 403:
            return Exception('Acesso negado.');
          case 404:
            return Exception('Recurso não encontrado.');
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
