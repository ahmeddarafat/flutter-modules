import 'package:dio/dio.dart';

class PNEndPoints {
  PNEndPoints._();

  static const String baseUrl = "https://fcm.googleapis.com/fcm";
  static const String send = "/send";
  static const String auth =
      "AAAAItfTFCA:APA91bENlDihkLeUXYHHbUKz3P9LT_uG_70Zot89voqThP3N9XAayZOiViDNO-8BhGO68qlW2xG56nW2V6rMO3VGBTnERtnBNDstaQCy1zR_vuM__JBBletmURRSbS9ifAVnCCASnU6D";
}

class PNHeaders {
  PNHeaders._();

  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String authorization = "Authorization";
}

class PNApiService {
  final Dio _dio;

  static Map<String, String> headers = {
    PNHeaders.contentType: PNHeaders.applicationJson,
    PNHeaders.authorization: "key=${PNEndPoints.auth}",
  };

  PNApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: PNEndPoints.baseUrl,
            headers: headers,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(milliseconds: 3600),
            receiveTimeout: const Duration(milliseconds: 3600),
          ),
        );

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.post(
      endPoint,
      data: data,
      queryParameters: query,
    );
  }
}
