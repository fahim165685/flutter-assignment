import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_assignment/app/core/core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeDurationWidget extends StatelessWidget {
  const HomeDurationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(children: [
      Column(
        children: [
          GradientCircularProgressIndicator(startDate: DateTime(2024, 1, 1), endDate: DateTime(2025, 3, 31),),
          Dimens.spaceH12,
          Text("সময় অতিবাহিত",style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700,),),
        ],
      ),

      Dimens.spaceW20,
       Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("মেয়াদকাল",style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),

            Dimens.spaceH4,
            Row(
              children: [
                SvgPicture.asset(AssetsConstants.calendarOutlineIcon,width: 14,height: 14,),

                Dimens.spaceW6,
                Expanded(child: Text(DateConverter.formatDateRangeInBengali(DateTime(2024, 1, 1), DateTime(2025, 3, 31)), style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),)),
            ],),

            Dimens.spaceH10,
            Text("আরও বাকি",style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700,color: ColorConstants.roseRedColor),),

            DateCountdownWidget(dateCountdown: AppHelper.calculateDateDifference(startDate: DateTime(2024, 1, 1), endDate: DateTime(2025, 3, 31)),)

          ],
        ),
      )
    ],);
  }
}



