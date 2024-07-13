import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get_connect/http/src/request/request.dart';

import '../../../app_pkg.dart';

FutureOr<Request> requestInterceptor(request) async {
  final token = StorageService.read(StorageConstants.accessToken);
  if(token != null){
    logInfo("Bearer Token =>$token");
  }

  if (token != null) {
    request.headers['X-Requested-With'] = 'XMLHttpRequest';
    request.headers['Authorization'] = 'Bearer $token';
  }
  if(request.method != 'get'){
    EasyLoading.show(status: 'loading...');
  }
  requestLogger(request);
  if(await NetworkUtil.checkInternetConnections()){
    return request;
  }else{
    AppHelper.toast(AppConstants.kNoInternet);
    throw AppConstants.kNoInternet;
  }
}
void requestLogger(Request request) {
  debugPrint("====> Request Url ${request.method} ${request.url}\n");
}
