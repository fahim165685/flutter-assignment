import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

class DateCountdownWidget extends StatelessWidget {
  final DateTime dateCountdown;

  const DateCountdownWidget({super.key, required this.dateCountdown,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateUnitWidget(unit: 'বছর', value: dateCountdown.year),
          Dimens.spaceW6,
          DateUnitWidget(unit: 'মাস', value: dateCountdown.month,),
          Dimens.spaceW6,
          DateUnitWidget(unit: 'দিন', value: dateCountdown.day,),
        ],
      ),
    );
  }

  Widget buildDateUnit(int value, String unit) {
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