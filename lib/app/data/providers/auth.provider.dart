import 'package:get/get.dart';

import '../data.dart';

class AuthProvider extends BaseProvider{
  final connect=Get.find<GetConnect>();
  Future<Response> login(String path, LoginRequest data) {
    return post(path, loginRequestToMap(data));
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path,  registerRequestToMap(data));
  }

  Future<Response> getUser(String path) {
    return get(path);
  }
  Future<Response> logout(String path) {
    return post(path,{});
  }

  Future<Response> sendOtp(String path,[String? otpMethod="sms", String purpose="Sign up"]) async{
    var bodyData={
      "otp_method" :otpMethod,
      "purpose" : purpose
    };
    return await post(path,bodyData);
  }
  Future<Response> verifyOtp(String path,int verifyId, String otpCode) async{
    var bodyData={
      "verify_id" : verifyId,
      "otp_code" : otpCode
    };
    return await post(path,bodyData);
  }
}