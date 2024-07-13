import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/app_network_controller.dart';

class AppNetworkView extends GetView<AppNetworkController> {
  const AppNetworkView({super.key});
  @override
  Widget build(BuildContext context) {
  return PopScope(
    canPop: false,
      child: Scaffold(
        body: Padding(
          padding: Dimens.pagePadding,
          child: Center(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: ColorConstants.whiteColor,
                boxShadow: [
                  BoxShadow(color: ColorConstants.blackColor.withOpacity(0.1),
                    spreadRadius: 5, blurRadius: 20)],
                borderRadius: BorderRadius.circular(12),),
              padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AssetsConstants.noInternetSVGImage),
                  Dimens.spaceH20,
                  Text(AppTranslations.noInternetConnection.tr,style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700,)),
                  Dimens.spaceH4,
                  Text(AppTranslations.checkInternetConnection.tr, textAlign: TextAlign.center, style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color: ColorConstants.gray500Color),),
                  Dimens.spaceH60,
                  CustomButton(onTap: () async{
                    if(await Provider().getUser()){
                     Get.back();
                    }else{
                      AppHelper.snackBarForError(bodyText: AppTranslations.noInternetConnection.tr);
                    }},
                      borderRadius: BorderRadius.circular(10),
                      width: Get.width, text: AppTranslations.retry.tr
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
