import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double radius;
  final String placeholder;
  final String? svg;
  final bool? forCircleImage;
  final bool isBrand;
  final bool showLoader;
  const CustomImage({
    super.key,
    this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder = AssetsConstants.placeholderImage,
    this.radius = 0,
    this.svg,
    this.forCircleImage,
    this.isBrand = false,
    this.showLoader = true,
  });

  @override
  Widget build(BuildContext context) {
    return svg != null ?
    ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SvgPicture.asset(svg!, height: height, width: width, fit: fit,)) :
    ClipRRect(borderRadius: BorderRadius.circular(radius),
      child: forCircleImage == true ?
      ClipRRect(borderRadius: BorderRadius.circular(height ?? 0.toDouble()),
          child:image!=null?
          CachedNetworkImage(imageUrl: image!, height: height, width: width, fit: fit,
              placeholder: (context, url) => Stack(children: [
                Image.asset(placeholder, height: height, width:width, fit: BoxFit.cover),
                const Align(alignment: Alignment.center, child: Center(child: CircularProgressIndicator(color: ColorConstants.whiteColor,)))]),
              errorWidget: (context, url, error) => Image.asset(placeholder, height: height, width: width, fit: BoxFit.cover)):  Image.asset(placeholder, height: height, width: Get.width, fit: BoxFit.cover)) :
      image!=null?
      CachedNetworkImage(imageUrl: image!, height: height, width: width, fit: fit,
        placeholder: (context, url) => Stack(children: [
          Image.asset(placeholder, height: height, width: width, fit: BoxFit.cover),
          if(!isBrand)
            const Align(alignment: Alignment.center, child: Center(child: CircularProgressIndicator(color: ColorConstants.whiteColor,)))]),
        errorWidget: (context, url, error) => Image.asset(placeholder, height: height, width: width, fit: BoxFit.cover),
      ) : Image.asset(placeholder, height: height, width: width, fit: BoxFit.cover) ,
    );
  }
}
