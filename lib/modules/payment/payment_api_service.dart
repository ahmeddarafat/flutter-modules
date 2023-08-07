import 'package:dio/dio.dart';

class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://accept.paymob.com/api";
  static const String authTokenEndPoint = "/auth/tokens";
  static const String orderIdEndPoint = "/ecommerce/orders";
  static const String paymentIdEndPoint = "/acceptance/payment_keys";
  static const String kioskEndPoint = "/acceptance/payments/pay";
  static const String apiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0Rjd01ETTFMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuaVpIalFsbzdRT2h1T21EQ0FNWkloVGVaTDZDeXozV21ydmJvcm9hY3NaX2pXT1JFa2hxTFZkSzFRQzZka2dURjJ1UE9GTk1BTWhMemVRTWdzQXJBMXc=";
  static const String kioskId = "4077525";
  static const String cardId = "4074138";
}
class PaymentVariables{
  PaymentVariables._();

  static String authToken = '';
  static String orderId = '';
  static String paymentToken = '';
  static String refCode = '';



}

class Headers {
  Headers._();

  static const String contentType = "content-type";
  static const String applicationJson = "application/json";
  static const String accept = "accept";
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
            baseUrl: ApiConstants.baseUrl,
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

  Future<Response<Map<String, dynamic>>> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
    );
  }
}
