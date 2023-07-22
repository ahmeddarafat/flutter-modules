import 'package:dio/dio.dart';

class EndPoints {
  EndPoints._();

  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  // static const String baseUrl = "http://192.168.1.6:3001/arafat/";
  static const String posts = "/posts";
}

class Headers {
  Headers._();

  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "Accept";
}

class ApiService {
  final Dio _dio;

  static Map<String, String> headers = {
    Headers.contentType: Headers.applicationJson,
    Headers.accept: Headers.applicationJson,
  };

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: EndPoints.baseUrl,
            headers: headers,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(milliseconds: 3600),
            receiveTimeout: const Duration(milliseconds: 3600),
          ),
        );

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: query,
    );
  }
}