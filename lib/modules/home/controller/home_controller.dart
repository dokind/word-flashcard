import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/shared.dart';
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

  /// init home screen and check onboarded
  Future<void> init() async {
    final bool isOnBoarded = await this.isOnBoarded();
    if (isOnBoarded) {
      await getwWords();
    } else {}
  }

  /// checking is `onboarded` or not
  Future<bool> isOnBoarded() async {
    final FlutterSecureStorage storage = getIt<FlutterSecureStorage>();
    final String? isOnBoarded =
        await storage.read(key: SecureStorageKeys.onBoard.name);

    return isOnBoarded != null ? true : false;
  }

  ///
  @override
  void dispose() {
    super.dispose();
  }
}
