import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/core/values/values.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboard.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => Get.dialog(Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: Dimens.cardPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Icon(Icons.exit_to_app_rounded,size:25),
                  Dimens.spaceW10,
                  Text("Confirm Exit..!!",style: GoogleFonts.roboto(color: ColorConstants.darkGrayColor,fontWeight: FontWeight.w600,fontSize: Dimens.fontSizeExtraMedium),),
                ],),

                Dimens.spaceH4,
                Text("Are you sure You want to exit",style: GoogleFonts.roboto(color: ColorConstants.gray300Color,fontWeight: FontWeight.w400,fontSize: Dimens.fontSizeDefault),),
                
                const Spacer(),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    TextButton(onPressed: () => Get.back(),
                      child:  Text("NO",style: GoogleFonts.roboto(color: ColorConstants.roseRedColor,fontWeight: FontWeight.w600,fontSize: Dimens.fontSizeDefault),),),

                    TextButton(onPressed: () => exit(0),
                        child: Text("YES",style: GoogleFonts.roboto(color: ColorConstants.roseRedColor,fontWeight: FontWeight.w600,fontSize: Dimens.fontSizeDefault),)),
                  ],),
                ),
              
                
                


              ],
            ),
          ),
        ),

      )),
      child: Scaffold(
          body: GetBuilder<DashboardController>(
            builder: (controller) => controller.nevBarIcons.elementAt(controller.selectedIndex).page,),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const FloatingButton(),

          bottomNavigationBar: BottomNavBarWidget()
      ),
    );
  }
}

