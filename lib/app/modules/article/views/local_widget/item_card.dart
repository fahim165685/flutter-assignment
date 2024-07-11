import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../app_pkg.dart';

class ItemCard extends StatelessWidget {
  final Gradient gradient;
  final ItemModel? item;
  final bool isLastItem;
  const ItemCard({super.key, required this.gradient, this.item, this.isLastItem = false,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: isLastItem?0 :16),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                DateConverter.formatTimeStamp(item?.date)??"",
                textAlign: TextAlign.center,
                style: Get.textTheme.titleMedium,),
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SvgPicture.asset(
                        AssetsConstants.clockCircleIcon,
                        colorFilter: AppHelper.svgIconColor(ColorConstants.whiteColor), height: 14,width: 14,),

                      Dimens.spaceW6,
                      Text(
                          DateConverter.formatTimeStamp(item?.date,showAMPM: false)??"",
                          style: Get.textTheme.titleSmall?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500))
                    ],),

                    Dimens.spaceH6,
                    Text(item?.name??"",
                        style: Get.textTheme.titleMedium?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w600)),

                    if(item?.category != null)...[
                      Dimens.spaceH6,
                      Text(item?.category??"",
                          style: Get.textTheme.titleSmall?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500)),
                    ],

                    if(item?.location != null)...[
                      Dimens.spaceH6,
                      Row(children: [
                        SvgPicture.asset(
                          AssetsConstants.mapPointIcon,
                          colorFilter: AppHelper.svgIconColor(ColorConstants.whiteColor),height: 14,width: 14,),
                        Dimens.spaceW6,
                        Text(item?.location??"",
                            style: Get.textTheme.titleSmall?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500))
                      ],),
                    ]

                  ],
                ),

              ))

        ],),
    );
  }
}