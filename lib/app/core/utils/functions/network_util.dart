
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:get/get.dart';

import '../../../app_pkg.dart';
class NetworkUtil {
  static Future<bool> checkNetworkConnectivity2() async {
    final List<connectivity.ConnectivityResult> connectivityResults = await connectivity.Connectivity().checkConnectivity();
    final connectivity.ConnectivityResult result = connectivityResults.first;
    return result != connectivity.ConnectivityResult.none;
  }

  static Future<bool> checkInternetConnections() async {
    final List<connectivity.ConnectivityResult> connectivityResults = await connectivity.Connectivity().checkConnectivity();
    final connectivity.ConnectivityResult result = connectivityResults.first;
    return result != connectivity.ConnectivityResult.none;
  }

  static Future<bool> checkInternetConnection() async {
    final List<connectivity.ConnectivityResult> result = await connectivity.Connectivity().checkConnectivity();
    final connectivity.ConnectivityResult connectivityResult = result.first;
    if (GetPlatform.isAndroid) {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      }else if (connectivityResult ==  connectivity.ConnectivityResult.ethernet) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.vpn) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.bluetooth) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.other) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    } else {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      }  else if (connectivityResult ==  connectivity.ConnectivityResult.ethernet) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.vpn) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.bluetooth) {
        return true;
      }else if (connectivityResult == connectivity.ConnectivityResult.other) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    }
  }


  static void networkErrorMessage(){
    AppHelper.snackBarForError(bodyText:'Sorry, there is no internet connection. Please connect and try again');
  }

  static Future<void> handleApiCall(Future<void> Function() apiCall,[String? errorMessage]) async {
    try {
      await apiCall();
    } catch (e, stacktrace) {
      logError('$errorMessage An error occurred :: $e stacktrace $stacktrace');
      // AppError('An error occurred');
    } finally {

    }
  }


  static Future<ApiResponse?>? errorHandleApi(Future<ApiResponse> Function( ) fn)async{
    try{
      final result =await fn();
      return result;
    }catch(error){
      logError("common error::: $error");
      // return ApiResponse.error(await result);
    }
    return null;
  }

}