import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final bool showBackButton;
  final bool showNotification;
  final bool showAppLogo;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.centerTitle = false,
    this.showBackButton = false,
    this.showAppLogo = false,
    this.showNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if(showBackButton){
            Get.back();
          }
        },
        icon: SvgPicture.asset(showBackButton? AssetsConstants.arrowLeftIcon: AssetsConstants.menuIcon),
      ),
      titleSpacing: centerTitle ? null : 0,
      centerTitle: centerTitle,
      title: Row(
        mainAxisSize: centerTitle ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (showAppLogo) ...[
            Image.asset(
              AssetsConstants.appLogo,
              height: 37, width: 37,
            ),
            Dimens.spaceW8,
          ],
          Text(title,
            style: titleStyle ??  Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
      actions: [
        if(showNotification)
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: CircleAvatar(
            radius: 17.5,
            backgroundColor: ColorConstants.gray100Color,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AssetsConstants.bellIcon, height: 20, width: 20,),
                const Positioned(top: 1, right: 2, child: Icon(Icons.circle, size: 7, color: ColorConstants.darkRedColor,))
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
