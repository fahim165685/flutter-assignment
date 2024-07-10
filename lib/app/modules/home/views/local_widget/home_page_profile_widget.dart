import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePageProfileWidget extends StatelessWidget {
  const HomePageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.cardPadding,
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: ColorConstants.blackColor.withOpacity(0.16),blurRadius: 6)]
      ),
      child: Row(
        children: [
          const CustomImage(
            placeholder: AssetsConstants.profileAvatarImage,
            height: 60, width: 60,radius: 100,
          ),

          Dimens.spaceW16,
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("মোঃ মোহাইমেনুল রেজা",
                style: Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),),

              Dimens.spaceH6,
              Text("সফটবিডি লিমিটেড",
                style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: ColorConstants.gray300Color),),

              Dimens.spaceH2,
              Row(children: [
                SvgPicture.asset(
                  AssetsConstants.mapPointIcon,
                  height: 16,width: 16,
                ),

                Dimens.spaceW4,
                Text("ঢাকা",
                  style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400, color: ColorConstants.gray300Color),),
              ],)
            ],
          ))
        ],
      ),
    );
  }
}