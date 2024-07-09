
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_pkg.dart';

class AppTheme {
  /// Light Theme


  ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: ColorConstants.primaryColor,
    cardColor: ColorConstants.whiteColor,
    scaffoldBackgroundColor: ColorConstants.backgroundColor,

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.notoSerifBengali(fontSize: Dimens.fontSizeLarge,fontWeight: FontWeight.w700,color: ColorConstants.blackColor),
      bodyMedium: GoogleFonts.notoSerifBengali(fontSize: Dimens.fontSizeOverMedium,fontWeight: FontWeight.w600,color: ColorConstants.blackColor),
      bodySmall: GoogleFonts.notoSerifBengali(fontSize: Dimens.fontSizeMedium,fontWeight: FontWeight.w600,color: ColorConstants.blackColor),

      titleLarge: GoogleFonts.notoSerifBengali(fontSize: Dimens.fontSizeExtraMedium,fontWeight: FontWeight.w600,color: ColorConstants.blackColor),
      titleMedium: GoogleFonts.notoSerifBengali(fontSize: Dimens.fontSizeDefault,fontWeight: FontWeight.w500,color: ColorConstants.blackColor),
      titleSmall: GoogleFonts.notoSerifBengali(fontSize: Dimens.fontSizeSmall,fontWeight: FontWeight.w400,color: ColorConstants.blackColor),
    ),

    iconTheme: const IconThemeData(color: ColorConstants.blackColor, size: 25.0),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.backgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: ColorConstants.whiteColor),
      titleTextStyle: GoogleFonts.notoSerifBengali(color: ColorConstants.backgroundColor,fontSize: Dimens.fontSizeMedium,fontWeight: FontWeight.w700),
    ),
  );

  /// Dark Theme
  ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: ColorConstants.primaryColor,
    cardColor: ColorConstants.whiteColor,
    scaffoldBackgroundColor: ColorConstants.backgroundColor,

    iconTheme: const IconThemeData(color: ColorConstants.secondaryColor, size: 25.0),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.backgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(color: ColorConstants.backgroundColor,fontSize: Dimens.fontSizeMedium,fontWeight: FontWeight.w400),
    ),
  );
}
