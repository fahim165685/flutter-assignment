import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTranslations.flutterTask.tr,
        titleStyle:  GoogleFonts.roboto(fontSize: Dimens.fontSizeMedium,color: ColorConstants.blackColor),
        showAppLogo: true, showNotification: true,
      ),
      body: const HomeBody(),
    );
  }
}
