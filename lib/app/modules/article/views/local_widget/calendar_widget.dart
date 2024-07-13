import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

class CalendarWidget extends StatelessWidget {
   const CalendarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstants.whiteColor,
            boxShadow: [BoxShadow(color: ColorConstants.blackColor.withOpacity(0.16), blurRadius: 6,),],
          ),

          child: SingleChildScrollView(
            key: const PageStorageKey<String>("calendar"),
            controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controller.days.map((date) {
                final isToday = date.day == controller.today.day && date.month == controller.today.month && date.year == controller.today.year;
                return DateCart(date:  date, isToday: isToday,);
              }).toList(),
            ),
          ),
        );
      }
    );
  }
}

class DateCart extends StatelessWidget {
  final DateTime date;
  final bool isToday;
  const DateCart({super.key, required this.date, this.isToday = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.find<ArticleController>().setToday(date),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: isToday?  const CustomGradientBorder(gradient: ColorConstants.primaryGradient,width: 1.5): null
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text( DateConverter.formatDay(date),
                    style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400,color: ColorConstants.gray300Color),),

                  Dimens.spaceH10,
                  Text(DateConverter.formatterDate(date),
                    style: Get.textTheme.bodySmall,),
                ]),
          ),
        ),
      ),
    );
  }
}
