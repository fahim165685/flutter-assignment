import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../../app_pkg.dart';

FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
  logData('Response received for ${request.url}::Status Code ${response.statusCode}');
  if(EasyLoading.isShow){
    EasyLoading.dismiss();
  }
  responseLogger(response);
  // if (response.statusCode != 200||response.statusCode != 201) {
  //   // handleErrorStatus(response);
  //   return response;
  // }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      logInfo("response body ${response.body}");
      break;
    default:
  }

  return;
}

void responseLogger(Response response) {
  if(response.statusCode==401){}
  debugPrint('Status Code: ${response.statusCode}\n');
  debugPrint('Data: ${response.bodyString?.toString() ?? ''}');
}
