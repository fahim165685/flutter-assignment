import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TimelineAppBar extends StatelessWidget implements PreferredSizeWidget   {
  const TimelineAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsConstants.menuIcon)),

      centerTitle: true,
      title: Text("সময়রেখা", style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),
      actions: [
        CircleAvatar(
          radius: 17.5,
          backgroundColor: ColorConstants.gray100Color,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AssetsConstants.bellIcon,
                height: 20,
                width: 20,
              ),
              const Positioned(top:1, right: 2,
                  child: Icon(Icons.circle,size: 7,color: ColorConstants.darkRedColor,))
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
