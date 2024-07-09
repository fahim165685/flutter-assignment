import 'package:get/get.dart';

import 'app_pkg.dart';


class DependencyInjection {
  static Future<void> init() async {
    Get.lazyPut<GetConnect>(
            () => GetConnect(
          timeout: const Duration(seconds: 30),
        )..baseUrl = AppConfig.baseUrl,
        fenix: true);

    Get.lazyPut(() => StorageService());
    Get.put<ThemeServices>(ThemeServices(),permanent: true);
    Get.put<LocalizationService>(LocalizationService(),permanent: true);
  }
}