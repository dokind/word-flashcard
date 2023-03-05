import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:labo001/shared/shared.dart';

class SettingsLogic {
  /// check is onboarded
  late final ValueNotifier<bool> hasCompletedOnboarding =
      ValueNotifier<bool>(false);

  Future<void> load() async {
    final FlutterSecureStorage storage = getIt<FlutterSecureStorage>();
    final String? isOnBoarded =
        await storage.read(key: SecureStorageKeys.onBoard.name);

    hasCompletedOnboarding.value = isOnBoarded != null ? true : false;
    // Future<void> changeLocale(Locale value) async {
    //   currentLocale.value = value.languageCode;
    //   await localeLogic.loadIfChanged(value);
    //   // Re-init controllers that have some cached data that is localized
    //   wondersLogic.init();
    //   timelineLogic.init();
    // }
  }
}
