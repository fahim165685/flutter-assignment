import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../app_pkg.dart';

class LocalizationService extends GetxController implements GetxService  {
  final _storage = GetStorage();
  final _key = StorageConstants.currentLocal;
  var currentLocale = AppLanguages.defaultLocale.obs;

  @override
  void onInit() {
    super.onInit();
    loadLocale();
  }

  void switchLanguage() {
    if (currentLocale.value == AppLanguages.defaultLocale) {
      currentLocale.value = const Locale('bn', 'BD');
    } else {
      currentLocale.value = AppLanguages.defaultLocale;
    }
    Get.updateLocale(currentLocale.value);
    saveLocale();
  }

  Future<void> saveLocale() async{
    await _storage.write(_key, currentLocale.value.toString());
  }

  void loadLocale() async {
    final localeCode = _storage.read(_key) ?? 'en_US';
    currentLocale.value = localeCode == 'bn_BD' ? const Locale('bn', 'BD') : AppLanguages.defaultLocale;
    Get.updateLocale(currentLocale.value);
  }

  bool isBanglaLanguage() => currentLocale.value == const Locale('bn', 'BD');
}