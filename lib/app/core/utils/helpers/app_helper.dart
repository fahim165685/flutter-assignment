import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
              ),
              colorScheme: ColorScheme.light(
                primary:Get.theme.primaryColor, // <-- SEE HERE
                onPrimary: Colors.white, // <-- SEE HERE
                onSecondary: Get.theme.primaryColor, // <-- SEE HERE
                secondary: Get.theme.primaryColor, // <-- SEE HERE
              ),
              textButtonTheme: const TextButtonThemeData(
                // style: TextButton.styleFrom(
                //   primary: Colors.w, // button text color
                // ),
              ),
            ),
            child: child!,
          );
        },
        context: Get.overlayContext!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
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
        messageText: Text(
          bodyText,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width * 0.7,
        padding: const EdgeInsets.only(bottom: 15, left: 12, right: 10, top: 5),
        margin: EdgeInsets.only(
            top: 25, left: Get.width * 0.05, right: Get.width * 0.05),
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
  }


