import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/app_constance.dart';

class DioHelper {
  static late Dio dio;
  static inti() {
    dio = Dio(BaseOptions(
        baseUrl: AppConstant.baseUrl,
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> getData(
      {required String url,
      Options? options,
      Map<String, dynamic>? querys,
      String? token}) async {
    return await dio.get(url, queryParameters: querys, options: options);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Options? options,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url,
        queryParameters: query, data: data, options: options);
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    Options? options,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      if (token != null) 'Authorization': token,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return await dio.patch(url,
        queryParameters: query, data: data, options: options);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? "",
      'Content-Type': 'application/json'
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
}
