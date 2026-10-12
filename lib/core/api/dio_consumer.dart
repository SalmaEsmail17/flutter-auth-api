import 'package:api_test/core/api/api_consumer.dart';
import 'package:api_test/core/api/api_interceptors.dart';
import 'package:api_test/core/api/endpoints.dart';

import 'package:api_test/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}){
 dio.options.baseUrl=Endpoints.baseUrl;
 dio.interceptors.add(ApiInterceptors());
 dio.interceptors.add(LogInterceptor(
   responseBody: true,
   requestBody: true

 ));
  }
  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData=false
  }) async {
    try {
      final response = await dio.delete(
        path,
        data:isFormData?FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData=false
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData=false
  }) async {
    try {
      final response = await dio.patch(
        path,
        data:isFormData?FormData.fromMap(data): data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData=false
  }) async {
    try {
      final response = await dio.post(
        path,
        data:isFormData?FormData.fromMap(data): data,
        queryParameters: queryParameters,

      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

}
