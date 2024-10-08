import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class AppLanguages extends Translations {
  static const Locale fallbackLocale = Locale('en', 'US');
  static const Locale defaultLocale = Locale('bn', 'BD');
  Map<String, Map<String, String>> get translations => {
    'bn_BD': BnLanguage().bnLanguage,
    'en_US': EnLanguage().enLanguage,
  };

  @override
  Map<String, Map<String, String>> get keys => translations;
}