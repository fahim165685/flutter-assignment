import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard.dart';

class BottomNavBarWidget extends StatelessWidget {
   BottomNavBarWidget({super.key}): assert(Get.find<DashboardController>().nevBarIcons.length == 4, "Bottom navigation bar item must be 4" );

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 75),
      painter: NavBarCustomPainter(),
      child: SizedBox( height: 75,
        child: Padding( padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GetBuilder<DashboardController>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(2, (index) {
                      String icon = controller.nevBarIcons.elementAt(index).icon;
                      String? selectedIcon = controller.nevBarIcons.elementAt(index).selectedIcon;
                      bool isSelected = index == controller.selectedIndex;
                      return Padding(
                        padding: EdgeInsets.only(right: index == 0 ? Get.width * 0.05 : 0),
                        child: CustomNavBarIcon(
                          onTap: () => controller.setSelectedIndex(index),
                          icon: icon, selectedIcon: selectedIcon, isSelected: isSelected,
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: List.generate(2, (index) {
                      String icon = controller.nevBarIcons.elementAt(index + 2).icon;
                      String? selectedIcon = controller.nevBarIcons.elementAt(index + 2).selectedIcon;
                      bool isSelected = (index + 2) == controller.selectedIndex;

                      return Padding(
                        padding: EdgeInsets.only(right: index == 0 ? Get.width * 0.05 : 0),
                        child: CustomNavBarIcon(
                          onTap: () => controller.setSelectedIndex(index + 2 ),
                          icon: icon,
                          selectedIcon: selectedIcon,
                          isSelected: isSelected,
                        ),
                      );
                    }),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}


