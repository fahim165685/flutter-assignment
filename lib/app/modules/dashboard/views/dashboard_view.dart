import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../dashboard.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: GetBuilder<DashboardController>(
          builder: (controller) => controller.nevBarIcons.elementAt(controller.selectedIndex).page,),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingButton(),

        bottomNavigationBar: BottomNavBarWidget()
    );
  }
}

