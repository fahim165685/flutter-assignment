import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget   {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsConstants.menuIcon)),
      titleSpacing: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AssetsConstants.appLogo,height: 37,width: 37,),
          
          Dimens.spaceW8,
          Text(
            AppTranslations.flutterTask.tr,
            style: GoogleFonts.roboto(fontSize: Dimens.fontSizeMedium,color: ColorConstants.blackColor),)
        ],
      ),
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
