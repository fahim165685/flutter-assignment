import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_pkg.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 56, width: 56,
        decoration: const BoxDecoration(gradient: ColorConstants.primaryGradient, shape: BoxShape.circle),
        child: SvgPicture.asset(AssetsConstants.cameraIcon,height: 32,width: 32,fit: BoxFit.scaleDown,),
      ),
    );
  }
}
