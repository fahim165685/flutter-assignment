import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app_pkg.dart';

class DashboardController extends GetxController implements GetxService {

  List<ItemModel>? items;
  int selectedIndex = 0;

  List<NevBarIconModel> nevBarIcons = [
     NevBarIconModel(
         icon: AssetsConstants.homeOutlineIcon, selectedIcon: AssetsConstants.homeIcon,
         binding: HomeBinding(), page: const HomeView()),

     NevBarIconModel(
         icon: AssetsConstants.calendarOutlineIcon,selectedIcon: AssetsConstants.calendarIcon,
         binding: ArticleBinding(), page: const ArticleView()),

     NevBarIconModel(icon: AssetsConstants.listIcon, page: const SizedBox()),
     NevBarIconModel(icon: AssetsConstants.profileIcon, page: const SizedBox()),
  ];

  void setSelectedIndex(int index) {
    if(index == selectedIndex) return;
    final binding = nevBarIcons.elementAt(index).binding;
    if(binding != null){binding.dependencies();}
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if(nevBarIcons.elementAt(selectedIndex).binding != null){
      nevBarIcons.elementAt(selectedIndex).binding?.dependencies();
    }
  }
}
