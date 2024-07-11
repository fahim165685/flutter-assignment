import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer(
              gradient: ColorConstants.shimmerGradient,
              child: Container(height: 15, width: Get.width*0.2,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstants.shimmerBgColor ))),

            Shimmer(
              gradient: ColorConstants.shimmerGradient,
              child: Container(height: 30, width: Get.width*0.3,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: ColorConstants.shimmerBgColor )),
            )

          ],),

        Dimens.spaceH20,
        Shimmer(
            gradient: ColorConstants.shimmerGradient,
            child: Container(height: 85, width: Get.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstants.shimmerBgColor ))),

        Dimens.spaceH20,

        Container(
            padding: Dimens.cardPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.whiteColor,
              boxShadow: [BoxShadow(color: ColorConstants.blackColor.withOpacity(0.16), blurRadius: 6,),],

            ),
          child: Shimmer(
            gradient: ColorConstants.shimmerGradient,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(height: 15, width: Get.width*0.3,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstants.shimmerBgColor )),
                ),

                Dimens.spaceH20,
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding:  EdgeInsets.only(bottom: (index+1)==4?0: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: Column(
                              children: [
                                Container(height: 10, width: 35,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstants.shimmerBgColor )),

                                Dimens.spaceH6,
                                Container(height: 10, width: 60,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstants.shimmerBgColor )),
                              ],
                            ),
                          ),
                          Dimens.spaceW6,
                          Expanded(child: Container(height: 150,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorConstants.shimmerBgColor )))
                        ],
                      ),
                    ),)

              ],
            ),
          ),
        ),


      ],);
  }
}
