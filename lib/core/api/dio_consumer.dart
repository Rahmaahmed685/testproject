import 'package:dio/dio.dart';
import 'package:testproject/core/api/api_consumer.dart';
import 'package:testproject/core/api/api_interceptors.dart';
import 'package:testproject/core/api/end_points.dart';
import 'package:testproject/core/errors/error_model.dart';
import 'package:testproject/core/errors/exception.dart';

class DioConsummer extends ApiConsumer {
  final Dio dio;

  DioConsummer({required this.dio}){
    dio.options.baseUrl= EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true
    ));
  }

  @override
  Future delete(
      String path,
      {dynamic data,
        Map<String, dynamic>? queryParameters,
        bool isFromData = false,

      }) async {
    try {
      final response = await dio.delete(
          path,
        data: isFromData ?FormData.fromMap(data): data,
          queryParameters: queryParameters,

      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
          path,
          data:data,
          queryParameters: queryParameters
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters,
        bool isFromData = false,
      }) async {
    try {
      final response = await dio.patch(
          path,
          data: isFromData ?FormData.fromMap(data): data,
          queryParameters: queryParameters
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic? data, Map<String, dynamic>? queryParameters,
        bool isFromData = false,
      }) async {
    try {
      final response = await dio.post(
          path,
          data: isFromData ?FormData.fromMap(data): data,
          queryParameters: queryParameters
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }




}
