import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_pkg.dart';
import '../../app_network/controllers/app_network_controller.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;


  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2),);
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0,).animate(animationController);
    animationController.repeat(reverse: true);
    route();
  }


  Future<void> route() async{
    await Future.delayed(const Duration(seconds: 3),()async{
      animationController.dispose();
      await Get.offAllNamed(Routes.DASHBOARD);
    });

  }

  @override
  void onClose() {
    super.onClose();
    Get.put(AppNetworkController(), permanent: true);
  }


}
