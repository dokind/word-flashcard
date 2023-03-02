import 'package:dio/dio.dart';

/// `Repository` is a design pattern that helps to encapsulate data access and provides a clear separation of concerns between data access and business logic. It is a commonly used approach in software development to create more modular, testable, and scalable code.

class AuthRepository {
  /// [apiClient]
  final Dio dio;

  /// [AuthRepository] constructor
  AuthRepository({required this.dio});

  /// check auth status
  Future<void> checkAuth() async {
    try {
      final Response response = await dio.get('/auth');
      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }

  /// login
  Future<void> login() async {
    try {
      final Response response = await dio.post('/auth/login');
      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }

  /// logout
  Future<void> logout() async {
    try {
      final Response response = await dio.post('/auth/logout');
      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }

  /// register
  Future<void> register() async {
    try {
      final Response response = await dio.post('/auth/register');
      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }
}
