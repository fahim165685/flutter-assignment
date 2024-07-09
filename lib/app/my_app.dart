import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'app_pkg.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeServices themeController = Get.find();
    //final LocalizationService localizationService = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      translations: AppLanguages(),
      locale: AppLanguages.defaultLocale,// localizationService.currentLocale.value,
      fallbackLocale: AppLanguages.fallbackLocale,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeController.getThemeMode(),
      builder: (context, child) {
        return EasyLoading.init()(context, MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        ));
      },
    );
  }
}
