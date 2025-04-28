import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchItems({required int page}) async {
    final response = await _dio.get(
      'https://rickandmortyapi.com/api/character',
      queryParameters: {'page': page, 'limit': 20},
    );
    return response.data['results']; // зависит от структуры ответа
  }
}
