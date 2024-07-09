import 'package:get/get.dart';

import '../../app_pkg.dart';

class AppProvider extends BaseProvider {
  final getConnect=Get.find<GetConnect>();
  //e2b
  Future<Response> getDivisions(String path) async{
    return await getConnect.get(path);
  }

  Future<Response> getDistricts(String path) async{
    return await getConnect.get(path);
  }

}