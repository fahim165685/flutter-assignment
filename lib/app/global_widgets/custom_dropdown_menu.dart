import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String? title;
  final String? hintText;
  final List<DropdownMenuEntry<String>> dropdownMenuItems;
  final Function(String?)? onSelected;
  final TextEditingController? controller;
  final double? borderRadius;
  final String? leadingIcon;
  final Color? leadingIconColor;

  const CustomDropdownMenu({
    super.key, this.title, this.hintText, required this.dropdownMenuItems,
    this.borderRadius = 10, this.leadingIcon, this.leadingIconColor, this.onSelected, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null)...[
          Text(title??"",
            style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),
          Dimens.spaceH6
        ],

        DropdownMenu(
            hintText: hintText,
            controller: controller,
            textStyle: Get.textTheme.titleMedium!.copyWith(color: ColorConstants.darkGrayColor,fontWeight: FontWeight.w400),
            expandedInsets: EdgeInsets.zero,
            trailingIcon: SvgPicture.asset(AssetsConstants.altArrowRightIcon,height: 16,width: 16,),
            selectedTrailingIcon: Transform.rotate(angle: 360/45.8,
                child: SvgPicture.asset(AssetsConstants.altArrowRightIcon,height: 16,width: 16,)),
            leadingIcon: leadingIcon != null? FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(leadingIcon!,width: 18,height: 18,colorFilter: AppHelper.svgIconColor(leadingIconColor), fit: BoxFit.scaleDown,)) : null,
            menuStyle: MenuStyle(
              elevation: const MaterialStatePropertyAll(2),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              backgroundColor: const MaterialStatePropertyAll(ColorConstants.white50Color),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
              visualDensity: VisualDensity.comfortable,
            ),
            onSelected: onSelected,
            inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                hintStyle: Get.textTheme.titleMedium!.copyWith(color: ColorConstants.gray300Color,fontWeight: FontWeight.w400),
                constraints: const BoxConstraints(minHeight: 40,maxHeight: 40),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2, color:  ColorConstants.white300Color),),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor ),),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2, color: ColorConstants.roseRedColor),),
                focusedErrorBorder : OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2, color: ColorConstants.roseRedColor),),
                contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16)
            ),
            dropdownMenuEntries: dropdownMenuItems),
      ],
    );
  }
}
