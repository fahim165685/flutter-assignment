import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_pkg.dart';

class CustomNavBarIcon extends StatelessWidget {
  final String icon;
  final String? selectedIcon;
  final Function()? onTap;
  final bool isSelected;
  const CustomNavBarIcon({super.key, required this.icon, this.onTap, this.isSelected = false, this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: SvgPicture.asset(isSelected? (selectedIcon?? icon):icon, height: 24,width: 24,),
          visualDensity: VisualDensity.compact,
          onPressed: onTap,
        ),

        //indicator
        Container(
          height: 4, width: 4,
          decoration:  BoxDecoration(
              gradient: isSelected? ColorConstants.primaryGradient:null,
              shape: BoxShape.circle
          ),
        ),
      ],
    );
  }
}
