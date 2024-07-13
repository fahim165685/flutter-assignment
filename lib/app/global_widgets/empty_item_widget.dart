import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class EmptyItemWidget extends StatelessWidget {
  const EmptyItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AssetsConstants.emptyItemSVGImage,
          width: Get.width*0.4,),

          Dimens.spaceH16,
          Text(AppTranslations.noItemsFound.tr,style: Get.textTheme.titleMedium?.copyWith(color: ColorConstants.gray300Color)),
          Dimens.spaceH6,
        ],),
    );
  }
}
