import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeDurationWidget extends StatelessWidget {
  const HomeDurationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(children: [
      Column(
        children: [
          GradientCircularProgressIndicator(startDate: DateTime(2024, 5, 1), endDate: DateTime(2025, 2, 0 ),),
          Dimens.spaceH8,
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
                Text("১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০", style: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),),
            ],),

            Dimens.spaceH10,
            Text("আরও বাকি",style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700,color: ColorConstants.roseRedColor),),

            const DateCountdownWidget(years: 9, months: 8, days: 17)

          ],
        ),
      )
    ],);
  }
}
