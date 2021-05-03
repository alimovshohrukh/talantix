import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:talantix/model/crypto_response.dart';

import 'dio_interceptors.dart';

class ApiProvider {
  final String _endpoint = "https://api.binance.com/api/v3/ticker/24hr";
  Dio _dio;

  ApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 4000, connectTimeout: 4000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<CryptoResponse> fetchData() async {
    try {
      Response response = await _dio.get(_endpoint);
      print(response);
      return CryptoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error StackTrace: $stacktrace");
      return CryptoResponse.withError(_handleError(error));
    }
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }

}
