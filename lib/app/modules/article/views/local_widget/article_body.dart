import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

class ArticleBody extends StatelessWidget {
  const ArticleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleController>(
      builder: (controller) {
        if(controller.getItemLoading){
          return const ShimmerLoadingWidget();
        }

        return RefreshIndicator(
          onRefresh: ()  => controller.getItem(isRefresh: true),
          color: ColorConstants.primaryColor,
          child: ListView(
            padding: Dimens.pagePadding,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('আজ, ${DateConverter.getCurrentDateInBengali()}',
                  style: Get.textTheme.bodySmall),

                CustomButton(
                  onTap: () => Get.toNamed(Routes.ADD_NEW_ARTICLE),
                  text: "নতুন যোগ করুন",
                  height: 30, borderRadius: BorderRadius.circular(50),
                  textStyle: Get.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700,color: ColorConstants.whiteColor),
                )],),

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

                    Visibility(
                      visible: controller.items.isNotEmpty,
                        replacement: const EmptyItemWidget(),
                        child:  ListView.builder(
                          itemCount: controller.items.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final gradient = ColorConstants.faqCardColor(index);
                            ItemModel? item = controller.items.elementAt(index);
                            bool isLastItem = controller.items.length == (index+1);
                            return ItemCard(gradient: gradient, item: item, isLastItem: isLastItem,);
                          },))

                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}


