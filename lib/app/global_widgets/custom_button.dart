import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/core/core.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.onTap, required this.text,
    this.height = 46, this.width, this.borderRadius,
    this.gradient = ColorConstants.primaryGradient, this.color, this.padding, this.textStyle,
  });

  final VoidCallback? onTap;
  final String text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final Gradient? gradient;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  //Space

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ,
        color: gradient != null ? color : null,
        gradient: color == null ? gradient : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: SizedBox(
            width: width, height: height,
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(text, style: textStyle ?? Get.textTheme.titleLarge?.copyWith(color: ColorConstants.whiteColor),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
