import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_app_gallery/core/api/api_errors.dart';
import 'package:test_app_gallery/core/services/network_service.dart';


class ApiClient {
  ApiClient({
    required Dio dio,
    required NetworkService networkService,
    required String? baseUrl,
  }) {
    _dio = dio;
    _networkService = networkService;
    _baseUrl = baseUrl ?? '';

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        
      ));
    }

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final isConnected = await _networkService.isConnected;
        if (isConnected) {
          return handler.next(options);
        } else {
          handler.reject(ApiNetworkException(requestOptions: options));
        }
      },
    ));
  }

  late final Dio _dio;
  late final NetworkService _networkService;
  late final String _baseUrl;

  Future<Response> sendRequest({
    required Future<Response> Function(Dio client) request,
    String? customBaseUrl,
  }) async {
    try {
      final client = _dio;
      client.options.baseUrl = customBaseUrl ?? _baseUrl;
      client.options.headers = {'Accept': 'application/json'};
      return await request(client);
    } on ApiNetworkException {
      rethrow;
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
