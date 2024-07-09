import 'package:get/get.dart';

import '../../app_pkg.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    final token = StorageService.read(StorageConstants.accessToken);
    httpClient.baseUrl = AppConfig.baseUrl;
    httpClient.timeout =  const Duration(seconds:Dimens.timeout );
    if(token!=null){
      httpClient.addAuthenticator(authInterceptor);
    }
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
  }
