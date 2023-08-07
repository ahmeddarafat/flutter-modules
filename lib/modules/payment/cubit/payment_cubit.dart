import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../payment_api_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final ApiService apiService;
  PaymentCubit(this.apiService) : super(PaymentInitialState());

  static PaymentCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentLoadingState());
    try {
      final response = await apiService.postData(
        endPoint: ApiConstants.authTokenEndPoint,
        body: {
          "api_key": ApiConstants.apiKey,
        },
      );
      PaymentVariables.authToken = response.data?["token"] ?? "";
      log("the auth token ${PaymentVariables.authToken}");
      emit(PaymentSuccessState());
    } catch (e) {
      emit(PaymentErrorState(e.toString()));
    }
  }

  Future<void> getOrderId() async {
    emit(PaymentLoadingState());
    try {
      final response = await apiService.postData(
        endPoint: ApiConstants.orderIdEndPoint,
        body: {
          "auth_token": PaymentVariables.authToken,
          "delivery_needed": "false",
          "amount_cents": "10",
          "currency": "EGP",
          "items": [
            {
              "name": "ASC1515",
              "amount_cents": "20",
              "description": "Smart Watch",
              "quantity": "1"
            }
          ],
          "shipping_data": {
            "apartment": "803",
            "email": "claudette09@exa.com",
            "floor": "42",
            "first_name": "Clifford",
            "street": "Ethan Land",
            "building": "8028",
            "phone_number": "+86(8)9135210487",
            "postal_code": "01898",
            "extra_description": "8 Ram , 128 Giga",
            "city": "Jaskolskiburgh",
            "country": "CR",
            "last_name": "Nicolas",
            "state": "Utah"
          },
          "shipping_details": {
            "notes": " test",
            "number_of_packages": 1,
            "weight": 1,
            "weight_unit": "Kilogram",
            "length": 1,
            "width": 1,
            "height": 1,
            "contents": "product of some sorts"
          }
        },
      );
      PaymentVariables.orderId = response.data?["id"].toString() ?? "";
      log("the order id ${PaymentVariables.orderId}");
      getPaymentKey();
      emit(PaymentSuccessState());
    } catch (e) {
      log("the order id error ${e.toString()}");
      emit(PaymentErrorState(e.toString()));
    }
  }

  Future<void> getPaymentKey() async {
    emit(PaymentLoadingState());
    try {
      final response = await apiService.postData(
        endPoint: ApiConstants.paymentIdEndPoint,
        body: {
          "auth_token": PaymentVariables.authToken,
          "amount_cents": "100",
          "expiration": 3600,
          "order_id": PaymentVariables.orderId,
          "billing_data": {
            "apartment": "803",
            "email": "claudette09@exa.com",
            "floor": "42",
            "first_name": "Clifford",
            "street": "Ethan Land",
            "building": "8028",
            "phone_number": "+86(8)9135210487",
            "shipping_method": "PKG",
            "postal_code": "01898",
            "city": "Jaskolskiburgh",
            "country": "CR",
            "last_name": "Nicolas",
            "state": "Utah"
          },
          "currency": "EGP",
          "integration_id": ApiConstants.cardId,
          "lock_order_when_paid": "false"
        },
      );
      PaymentVariables.paymentToken = response.data?["token"] ?? "";
      log("the payment token ${PaymentVariables.paymentToken}");
      emit(PaymentSuccessState());
    } catch (e) {
      log("the payment token error ${e.toString()}");
      emit(PaymentErrorState(e.toString()));
    }
  }

  Future<void> getRefCode() async {
    emit(PaymentLoadingState());
    try {
      final response = await apiService.postData(
        endPoint: ApiConstants.kioskEndPoint,
        body: {
          "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
          "payment_token": PaymentVariables.paymentToken,
        },
      );
      PaymentVariables.refCode = response.data?["id"].toString() ?? "";
      log("the ref code ${PaymentVariables.refCode}");
      emit(PaymentSuccessState());
    } catch (e) {
      log("the ref code error${e.toString()}");
      emit(PaymentErrorState(e.toString()));
    }
  }
}
