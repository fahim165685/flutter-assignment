


import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

import '../../../app_pkg.dart';

FutureOr<Request> authInterceptor(request) async {
  logInfo('auth interceptor call ====');
  final token = StorageService.read(StorageConstants.accessToken);
  request.headers['X-Requested-With'] = 'XMLHttpRequest';
  request.headers['Authorization'] = 'Bearer $token';
  return request;
}