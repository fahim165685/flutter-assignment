

import 'package:get/get.dart';

import '../../app_pkg.dart';


class HomeProvider extends BaseProvider{
 Future<Response> getTopic(String path) async{
  return await get(path);
 }
 Future<Response> getQuestionSet(String path) async{
  return await get(path);
 }
 Future<Response> getBundlePackage(String path) async{
  return await get(path);
 }
 Future<Response> getQuestionDetails(String path) async{
  return await get(path);
 }
}