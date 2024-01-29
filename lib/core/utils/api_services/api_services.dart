import 'package:dio/dio.dart';

class ApiServices {
  static const baseurl = 'https://www.googleapis.com/books/v1/';
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseurl,
  ));

  get(
      {Map<String, dynamic>? params,
      Map<String, dynamic>? body,
      required String endpoint}) async{
    return await dio.get(endpoint, data: body, queryParameters: params);
  }
}
