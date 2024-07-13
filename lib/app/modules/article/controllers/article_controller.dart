import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../app_pkg.dart';

class ArticleController extends GetxController {
  final DashboardRepository dashboardRepository;
  ArticleController({required this.dashboardRepository});

  final dashboardController = Get.find<DashboardController>();

  ScrollController scrollController = ScrollController();
  DateTime today = DateTime.now();
  List<DateTime> previousWeek = [];
  List<DateTime> nextWeek = [];
  List<DateTime> days = [];
  List<ItemModel> get items => getItemsForToday();
  List<String> paragraphsCategory = ["অনুচ্ছেদ", "বাক্য", "শব্দ"];
  List<String> districtList = AppConstants.districtList;
  bool getItemLoading = false;

  List<ItemModel> getItemsForToday() {
    final todayDateOnly = DateTime(today.year, today.month, today.day);
    return dashboardController.items?.where((item) {
      if (item.date == null) return false;
      final itemDate = DateTime.fromMillisecondsSinceEpoch(int.parse(item.date!) * 1000);
      final itemDateOnly = DateTime(itemDate.year, itemDate.month, itemDate.day);
      return itemDateOnly == todayDateOnly;
    }).toList() ?? [];
  }

  @override
  void onInit() {
    super.onInit();
    previousWeek = List<DateTime>.generate(7, (i) => today.subtract(Duration(days: 7 - i)));
    nextWeek = List<DateTime>.generate(7, (i) => today.add(Duration(days: i + 1)));
    days = [...previousWeek, today, ...nextWeek];

    if(dashboardController.items == null || (dashboardController.items?.isEmpty??true)) {
      getItem().then((value) => Future.delayed(const Duration(milliseconds: 500),() => scrollToToday(),));
    }else{
      Future.delayed(const Duration(milliseconds: 500),() => scrollToToday());
    }
  }

  void setToday(DateTime date){
    today = date;
    scrollToToday();
    update();
  }

  Future<void> getItem({bool isRefresh =false}) async{
    try {
      if(!isRefresh){
        getItemLoading = true;
      }
      ApiResponse<List<ItemModel>?>? response = await dashboardRepository.getDate();
      if(response?.success==true){
        dashboardController.items = response?.data;

        final now = DateTime.now();
        if (DateTime(today.year, today.month, today.day) != DateTime(now.year, now.month, now.day)) {
          today = now;
          scrollToToday();
        }


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
    int todayIndex = days.indexWhere((element) => DateTime(element.year,element.month,element.day) ==  DateTime(today.year,today.month,today.day));
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
