import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_assignment/app/core/utils/helpers/date_converter.dart';
import 'package:flutter_assignment/app/modules/timeline/timeline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TimelineBody extends StatelessWidget {
  const TimelineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimelineController>(
      builder: (controller) {
        if(controller.getItemLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        return ListView(
          padding: Dimens.pagePadding,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('আজ, ${DateConverter.getCurrentDateInBengali()}',
                style: Get.textTheme.bodySmall),

              CustomButton(
                onTap: () {},
                text: "নতুন যোগ করুন",
                height: 30, borderRadius: BorderRadius.circular(50),
                textStyle: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700,color: ColorConstants.whiteColor),
              )

            ],),

            Dimens.spaceH20,
            const CalendarWidget(),

            Dimens.spaceH20,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.whiteColor,
                boxShadow: [BoxShadow(color: ColorConstants.blackColor.withOpacity(0.16), blurRadius: 6,),],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("আজকের কার্যক্রম",style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),),

                  Dimens.spaceH10,
                  ListView.builder(
                    itemCount: controller.items?.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final gradient = ColorConstants.faqCardColor(index);
                      ItemModel? item = controller.items?.elementAt(index);
                      bool isLastItem = controller.items?.length == (index+1);
                      return ItemCard(gradient: gradient, item: item, isLastItem: isLastItem,);
                      },)

                ],
              ),
            )
          ],
        );
      }
    );
  }
}


class ItemCard extends StatelessWidget {
  final Gradient gradient;
  final ItemModel? item;
  final bool isLastItem;
  const ItemCard({super.key, required this.gradient, this.item, this.isLastItem = false,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: isLastItem?0 :16),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                DateConverter.formatTimeStamp(item?.date)??"",
                textAlign: TextAlign.center,
                style: Get.textTheme.titleMedium,),
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SvgPicture.asset(
                        AssetsConstants.clockCircleIcon,
                        colorFilter: AppHelper.svgIconColor(ColorConstants.whiteColor), height: 14,width: 14,),

                      Dimens.spaceW6,
                      Text(
                        DateConverter.formatTimeStamp(item?.date,showAMPM: false)??"",
                        style: Get.textTheme.titleSmall?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500))
                    ],),

                    Dimens.spaceH6,
                    Text(item?.name??"",
                      style: Get.textTheme.titleMedium?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w600)),

                    if(item?.category != null)...[
                      Dimens.spaceH6,
                      Text(item?.category??"",
                          style: Get.textTheme.titleSmall?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500)),
                    ],

                    if(item?.location != null)...[
                      Dimens.spaceH6,
                      Row(children: [
                        SvgPicture.asset(
                          AssetsConstants.mapPointIcon,
                          colorFilter: AppHelper.svgIconColor(ColorConstants.whiteColor),height: 14,width: 14,),
                        Dimens.spaceW6,
                        Text(item?.location??"",
                            style: Get.textTheme.titleSmall?.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500))
                      ],),
                    ]

                  ],
                ),

          ))

        ],),
    );
  }
}

