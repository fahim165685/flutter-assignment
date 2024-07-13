
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app_pkg.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await DependencyInjection.init();
  await initializeDateFormatting();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,]);
  runApp(const MyApp());
  configLoading();

  ErrorWidget.builder = (FlutterErrorDetails details) => Center(
    child: SafeArea(
      child: Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.amberAccent.shade400, borderRadius: BorderRadius.circular(12)),
        child: Text(details.exception.toString()),
      ),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..backgroundColor = ColorConstants.whiteColor
    ..indicatorColor = ColorConstants.primaryColor
    ..textColor = ColorConstants.blackColor
    ..boxShadow = [BoxShadow(color: ColorConstants.blackColor.withOpacity(0.16),blurRadius: 6)]
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}