import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../repository/repository.dart';

///
class HomeController extends ChangeNotifier {
  /// [HomeRepository] repo
  final HomeRepository repository;

  /// [words] words
  List<dynamic>? words;

  /// [isLoading]
  bool isLoading = false;

  /// [HomeController] const
  HomeController(this.repository);

  /// [getwWords] get words from API
  Future<void> getwWords() async {
    try {
      isLoading = true;
      notifyListeners();
      words = await repository.getWords();
    } on DioError catch (e) {
      dev.log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  ///
  @override
  void dispose() {
    super.dispose();
  }
}
