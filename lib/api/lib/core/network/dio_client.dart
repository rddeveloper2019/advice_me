import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        responseType: ResponseType.json, // 🔥 Ключевая настройка!
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: false,
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );

    // 🔧 Интерцептор для принудительного парсинга JSON
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.data is String) {
            try {
              response.data = jsonDecode(response.data as String);
            } catch (e) {
              debugPrint('⚠️ JSON parse fallback failed: $e');
            }
          }
          return handler.next(response);
        },
        onError: (DioException err, handler) {
          debugPrint('❌ Dio error: ${err.message}');
          return handler.next(err);
        },
      ),
    );

    return dio;
  }
}
