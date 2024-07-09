
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app_pkg.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await DependencyInjection.init();
  runApp(
    const MyApp(),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..backgroundColor = ColorConstants.whiteColor
    ..textColor = ColorConstants.blackColor
    ..boxShadow = [BoxShadow(color: ColorConstants.blackColor.withOpacity(0.16),blurRadius: 6)]
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}