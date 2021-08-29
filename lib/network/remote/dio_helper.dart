import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio dio;
  //https://newsapi.org/
  //v2/top-headlines?
  //country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca
  ///Create Obj
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(path, queryParameters: query);
  }
}
