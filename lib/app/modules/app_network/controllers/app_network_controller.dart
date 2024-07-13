import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AppNetworkController  extends GetxController {
  final _connectivityResult = ConnectivityResult.none.obs;
  var isInit = false;


  ConnectivityResult get connectivityResult => _connectivityResult.value;


  void updateConnectivityResult(ConnectivityResult result) {
    _connectivityResult.value = result;
    showConnectivitySnackBar(result);

  }

  @override
  void onInit() {
    super.onInit();
    isInit = false;
    Connectivity().onConnectivityChanged.listen((result)async {
      if (result.isNotEmpty && result.first == ConnectivityResult.none) {
        Get.toNamed(Routes.APP_NETWORK);
      } else{
        if(isInit){
          if(await Provider().getUser()){
            Get.back();
          }else{
            AppHelper.snackBarForError(bodyText: AppTranslations.noInternetConnection.tr);
          }
        }
      }
      isInit = true;
    });

  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    String message = result != ConnectivityResult.none
        ? 'Connected to the internet'
        : 'No internet connection';

    Get.snackbar(
      'Connection Status',
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration:const Duration(seconds: 3),
    );
  }
}

class Provider extends GetConnect{
  Future<bool> getUser() async{
    await EasyLoading.show();
    try{
      final response = await get("http://www.google.com");
      if(response.statusCode == 200){
        await EasyLoading.dismiss();
        return true;
      }else{
        await EasyLoading.dismiss();
        return false;
      }
    }catch(e){
      await EasyLoading.dismiss();
      return false;
    }
  }
}