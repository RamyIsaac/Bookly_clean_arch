import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var result = await _dio.get('$baseUrl$endPoint');

    return result.data;
  }
}
