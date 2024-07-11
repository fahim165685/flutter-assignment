import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../app_pkg.dart';

class ArticleController extends GetxController {
  final DashboardRepository dashboardRepository;
  ArticleController({required this.dashboardRepository});

  final dashboardController = Get.find<DashboardController>();

  List<ItemModel>? get items => dashboardController.items;

  ScrollController scrollController = ScrollController();
  final today = DateTime.now();
  List<DateTime> previousWeek = [];
  List<DateTime> nextWeek = [];
  List<DateTime> days = [];
  List<String> paragraphsCategory = ["অনুচ্ছেদ", "বাক্য", "শব্দ"];
  List<String> districtList = AppConstants.districtList;
  bool getItemLoading = false;


  @override
  void onInit() {
    super.onInit();
    previousWeek = List<DateTime>.generate(7, (i) => today.subtract(Duration(days: 7 - i)));
    nextWeek = List<DateTime>.generate(7, (i) => today.add(Duration(days: i + 1)));
    days = [...previousWeek, today, ...nextWeek];

    if(items == null) {
      getItem().then((value) => Future.delayed(const Duration(milliseconds: 500),() => scrollToToday(),));
    }else{
      Future.delayed(const Duration(milliseconds: 500),() => scrollToToday());
    }
  }


  Future<void> getItem({bool isRefresh =false}) async{
    try {
      if(!isRefresh){
        getItemLoading = true;
      }
      ApiResponse<List<ItemModel>?>? response = await dashboardRepository.getDate();
      if(response?.success==true){
        dashboardController.items = response?.data;
      }else{
        logError("Get Item Error =>${response?.errorMessage}");
      }
    } catch(e){
      logError("Get Item  Error =>$e");
    }finally{
      getItemLoading = false;
      update();
    }
  }

  void scrollToToday() {
    int todayIndex = days.indexOf(today);
    if (todayIndex >= 0) {
      double screenWidth = Get.width;
      double itemWidth = screenWidth / 7.8; // Assuming 7 items visible
      double scrollOffset = todayIndex * itemWidth - screenWidth / 2 + itemWidth / 2;
      scrollController.animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> addNewArticle(ItemModel date) async{
    await EasyLoading.show(status: "Please Wait..");
    await Future.delayed(const Duration(seconds: 3));
    dashboardController.items?.add(date);
    await EasyLoading.dismiss();
    AppHelper.doneDialog();
    update();

  }


}
