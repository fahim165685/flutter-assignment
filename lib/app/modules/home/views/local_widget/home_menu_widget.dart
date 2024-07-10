import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 80/124, crossAxisSpacing: 42,mainAxisSpacing: 24 ),
          itemCount: controller.menuItem.length,
          itemBuilder: (context, index) => MenuCard(icon: controller.menuItem.elementAt(index), menuNo: (index+1)),
        );
      }
    );
  }
}
