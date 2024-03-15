
import 'package:dio/dio.dart';

import 'error_model.dart';

class ServierException implements Exception {
  final ErrorModel errorModel;

  ServierException({required this.errorModel});

}

  void handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.sendTimeout:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.receiveTimeout:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.badCertificate:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.cancel:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.connectionError:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.unknown:
        throw ServierException(
            errorModel: ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400 :
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));

          case 401:
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));

          case 403:
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));

          case 404:
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));

          case 409:
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));

          case 422:
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));

          case 504:
            throw ServierException(
                errorModel: ErrorModel.fromJson(e.response!.data));
        }
    };
  }

