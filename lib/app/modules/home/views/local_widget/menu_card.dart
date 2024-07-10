import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../app_pkg.dart';

class MenuCard extends StatelessWidget {
  final String icon;
  final int menuNo;
  const MenuCard({super.key, required this.icon, required this.menuNo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Dimens.spaceH2,
          Container(
            height: 72, width: 72,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: ColorConstants.gray25Color, borderRadius: BorderRadius.circular(8),),
            alignment: Alignment.center,
            child: SvgPicture.asset(icon,),
          ),

          Dimens.spaceH8,
          Text("মেনু নং\n০০০০${AppHelper.convertToBangla(menuNo.toString())}",
            textAlign: TextAlign.center, style: Get.textTheme.bodySmall,)
        ],
      ),
    );
  }
}