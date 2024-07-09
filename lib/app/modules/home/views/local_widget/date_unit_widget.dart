import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_pkg.dart';

class DateUnitWidget extends StatelessWidget {
  final int value;
  final String unit;
  const DateUnitWidget({super.key, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    String valueString = value.toString();
    valueString = valueString.padLeft(2, '0');
    return Column(
      children: [
        Row(
            children: valueString.split('').map((char) {
              return Container(
                height: 24,width: 24,
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  color: ColorConstants.gray100Color,
                  border: Border.all(color: ColorConstants.roseRedColor),
                  borderRadius: BorderRadius.circular(4),),
                alignment: Alignment.center,
                child: Text(AppHelper.convertToBangla(char),
                    style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500)),
              );
            }).toList()),

        Dimens.spaceH2,
        Text(unit, style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
