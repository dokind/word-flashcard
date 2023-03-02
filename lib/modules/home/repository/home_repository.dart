import 'package:dio/dio.dart';

/// `Repository` is a design pattern that helps to encapsulate data access and provides a clear separation of concerns between data access and business logic. It is a commonly used approach in software development to create more modular, testable, and scalable code.

class HomeRepository {
  /// [apiClient]
  final Dio dio;

  /// [HomeRepository] constructor
  HomeRepository({required this.dio});

  /// get words from api
  Future<List<dynamic>> getWords() async {
    final Response<List<dynamic>> response =
        await dio.get('https://random-word-api.herokuapp.com/word?number=100');
    return response.data ?? <dynamic>[];
  }
}
