import 'package:get/get.dart';

import '../../app_pkg.dart';


class DashboardProvider extends BaseProvider{
 final connect = Get.find<GetConnect>();

 Future<Response> getDate(String path) async{
  return await get(path);
 }

}