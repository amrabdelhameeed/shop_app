import 'package:dio/dio.dart';

import '../constants/app_strings.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: ApiStrings.baseUrl, headers: {
      "Content-Type": "application/json",
      "lang": "ar",
    }));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      "Authorization": AppStrings.token ?? ''
    };
    return dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      "Authorization": AppStrings.token
    };
    return await dio!.put(url, queryParameters: query, data: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': AppStrings.token ?? '',
    };
    return dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> getData2({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    Dio? dio2;
    dio2 = Dio(BaseOptions(baseUrl: ApiStrings.addressBaseUrl));
    return dio2.get(
      url,
      // queryParameters: query,
    );
  }
}
