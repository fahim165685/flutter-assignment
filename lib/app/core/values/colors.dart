import 'package:flutter/material.dart';

import '../../app_pkg.dart';

class ColorConstants {
  ColorConstants._();
  static const Color primaryColor =  Color(0xFF86B560);
  static const Color secondaryColor = Color(0xFF336F4A);
  static const Color backgroundColor = Color(0xFFFFFFFF);


  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const Color roseRedColor = Color(0xFFFF737A);
  static const Color darkRedColor = Color(0xFFBC2200);

  static const Color gray25Color = Color(0xFFF5F5F5);
  static const Color gray100Color = Color(0xFFF4F5F6);
  static const Color gray300Color = Color(0xFF6A6A6A);
  static const Color gray500Color = Color(0xFF202020);
  static const Color darkGrayColor = Color(0xFF202020);

  static const LinearGradient primaryGradient = LinearGradient(colors: [primaryColor, secondaryColor],  begin: Alignment.topLeft, end: Alignment.bottomRight,);

  static Gradient faqCardColor(int index) => AppHelper.getRandomGradient(index: index, colors: [
    primaryGradient,
    const LinearGradient(colors: [gray500Color, gray500Color ])
  ]);

  static const Color shimmerBgColor =  Color(0xFFf6f7f8);
  static const LinearGradient shimmerGradient =  LinearGradient(colors: [Color(0xFFeaeaf4), Color(0xFFF4F4F4), Color(0xFFeaeaf4),],
    stops: [0.1, 0.3, 0.4,], begin: Alignment(-1.0, -0.3), end: Alignment(1.0, 0.3), tileMode: TileMode.clamp,);

}

