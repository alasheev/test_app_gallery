import 'package:dio/dio.dart';
import 'package:test_app_gallery/core/errors.dart';

class ApiNetworkException extends DioError implements Exception {
  ApiNetworkException({required super.requestOptions});

  factory ApiNetworkException.fromDioError(DioError err) {
    return ApiNetworkException(requestOptions: err.requestOptions);
  }
}

class ApiNetworkFailure extends Failure {}

class ApiException extends DioError implements Exception {
  ApiException({
    required super.requestOptions,
    required super.response,
    required this.data,
  });

  factory ApiException.fromResponse(Response res) {
    return ApiException(
      requestOptions: res.requestOptions,
      response: res,
      data: res.data,
    );
  }

  factory ApiException.fromDioError(DioError err) {
    return ApiException(
      requestOptions: err.requestOptions,
      response: err.response,
      data: err.response?.data,
    );
  }

  dynamic data;
}

class ApiFailure extends Failure {
  ApiFailure({
    required this.requestOptions,
    required this.response,
    required this.data,
  });

  factory ApiFailure.fromException(ApiException e) {
    return ApiFailure(
      requestOptions: e.requestOptions,
      response: e.response,
      data: e.data,
    );
  }

  final RequestOptions? requestOptions;
  final Response? response;
  dynamic data;
}
