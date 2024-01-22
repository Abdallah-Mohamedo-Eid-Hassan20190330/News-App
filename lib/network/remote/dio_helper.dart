import 'package:dio/dio.dart';

// baseUrl: https://newsapi.org/
// method : v2/top-headlines
// qurey  : ?country=eg&category=business&apiKey=$apiKey

// search api :
// baseUrl : https://newsapi.org/
// method : v2/everything
// qurey : ?q=tesla&from=2023-07-10&sortBy=publishedAt&apiKey=$apiKey

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String path, required Map<String, dynamic> query}) async {
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}
