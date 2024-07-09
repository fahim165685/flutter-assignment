import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder<SplashController>(
          builder: (controller) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                    opacity: controller.opacityAnimation,
                    child: FlutterLogo(size: Get.width*0.4,)),

                Dimens.spaceH18,
                Text(AppTranslations.flutterTask.tr, style: GoogleFonts.roboto(fontSize: Dimens.fontSizeExtraLarge,color: ColorConstants.darkGrayColor),)

              ],
            )
          );
        }
      ),
    );
  }
}
