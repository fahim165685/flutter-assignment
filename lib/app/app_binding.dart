
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

import 'data/data.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {

    //provider
    Get.put(DashboardProvider(), permanent: true);

    //Repository
    Get.put(DashboardRepository(homeProvider: Get.find()), permanent: true);
  }
}