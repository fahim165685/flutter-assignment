import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../app_pkg.dart';

class AppHelper{
  AppHelper._();

  static Future<String?> datePickerShow([String? dateFormat]) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              datePickerTheme: DatePickerThemeData(
                headerBackgroundColor:Get.theme.primaryColor,
                headerForegroundColor: Colors.white,
                backgroundColor: Colors.white,
                yearStyle: GoogleFonts.roboto(color: ColorConstants.darkGrayColor, fontSize:Dimens.fontSizeMedium,fontWeight: FontWeight.w400),
                dayStyle: GoogleFonts.roboto(color: ColorConstants.darkGrayColor, fontSize:Dimens.fontSizeDefault,fontWeight: FontWeight.w400),
                weekdayStyle: GoogleFonts.roboto(color: ColorConstants.gray300Color, fontSize:Dimens.fontSizeDefault,fontWeight: FontWeight.w400),
              ),

              textTheme: TextTheme(
                bodyLarge: GoogleFonts.roboto(fontSize: Dimens.fontSizeMedium,fontWeight: FontWeight.w600,color: ColorConstants.blackColor),
              ),
              inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                labelStyle: GoogleFonts.roboto(color: ColorConstants.darkGrayColor, fontSize:Dimens.fontSizeMedium,fontWeight: FontWeight.w400),
              ),
              colorScheme: ColorScheme.light(
                primary:Get.theme.primaryColor,
                onPrimary: Colors.white,
                onSecondary: Get.theme.primaryColor,
                secondary: Get.theme.primaryColor,
              ),
            ),
            child: child!,
          );
        },
        context: Get.overlayContext!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate =
      DateFormat(dateFormat ?? 'yyyy-MM-dd').format(pickedDate);

      return formattedDate;
    } else {}
    return null;
  }

  static ColorFilter? svgIconColor([Color? color]){
    if(color == null){return null;}
    return ColorFilter.mode(color, BlendMode.srcIn);}

  static void snackBarForError({String? titleText, required String bodyText, double? topMargin,}) {
    Get.snackbar("", "",
        titleText: const SizedBox.shrink(),
        messageText: Center(
          child: Text( bodyText,
            style: GoogleFonts.roboto(color: ColorConstants.whiteColor,fontSize: Dimens.fontSizeMedium)),
        ),
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width * 0.7,
        padding: const EdgeInsets.only(bottom: 15, left: 12, right: 10, top: 8),
        margin: EdgeInsets.only(top: 25, left: Get.width * 0.05, right: Get.width * 0.05),
        borderRadius: 4,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white);
  }

  static void snackBarForSuccess({String? titleText, required String bodyText, double? topMargin,}) {
    Get.snackbar("", "",
        titleText: const SizedBox.shrink(),
        messageText: Text(bodyText,
          style:Get.textTheme.titleMedium,
        ),
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width * 0.7,
        padding: const EdgeInsets.only(bottom: 15, left: 12, right: 10, top: 5),
        margin: EdgeInsets.only(
            top: 25, left: Get.width * 0.05, right: Get.width * 0.05),
        borderRadius: 4,
        backgroundColor: ColorConstants.whiteColor.withOpacity(0.9),
        colorText: Colors.white);
  }

  static void toast(String? error) async {
    await Fluttertoast.showToast(
        msg: error??"",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static Color getRandomColor({required int index, required List<Color> colors, }) {
    return colors[index % colors.length ];
  }

  static Gradient getRandomGradient({required int index, required List<Gradient> colors, }) {
    return colors[index % colors.length ];
  }

  static String convertToBangla(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bangla[i]);
    }
    return input;
  }

  static DateTime calculateDateDifference({required DateTime startDate , required DateTime endDate}) {
    Duration difference = endDate.difference(startDate);

    int years = difference.inDays ~/ 365;
    int remainingDaysAfterYears = difference.inDays % 365;

    int months = remainingDaysAfterYears ~/ 30;
    int days = remainingDaysAfterYears % 30;

     return DateTime(years, months,days);
  }


  static Future<void> doneDialog()async {
    return Get.dialog(
        PopScope(
          canPop: false,
          child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              insetPadding: const EdgeInsets.all(20),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AssetsConstants.doneSVGImage,width: 100,height: 100,),

                    Dimens.spaceH20,
                    Text("নতুন অনুচ্ছেদ সংরক্ষন",style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),

                    Dimens.spaceH8,
                    Text("আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন\nহয়েছে ",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleMedium?.copyWith(color: ColorConstants.gray300Color, fontWeight: FontWeight.w400),),

                    Dimens.spaceH12,
                    CustomButton(onTap: () => Get.back(),
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      text: "আরও যোগ করুন",borderRadius: BorderRadius.circular(8),)


                  ],
                ),
              )),
        ),barrierDismissible: false);
  }

  }


