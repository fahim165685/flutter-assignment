import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  List<String> menuItem = [
    AssetsConstants.homeMenuIcon1,
    AssetsConstants.homeMenuIcon2,
    AssetsConstants.homeMenuIcon3,
    AssetsConstants.homeMenuIcon4,
    AssetsConstants.homeMenuIcon5,
    AssetsConstants.homeMenuIcon6,
  ];

}
