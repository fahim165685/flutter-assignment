import 'package:get/get.dart';



abstract class BaseResponse {
  BaseResponse._();
 static bool handleApiResponse(Response response) {
    if (response.statusCode == 200) {
      //final responseData = response.body;
      // Process responseData here
      return true; // Successful response
    } else {
      return false; // Unsuccessful response
    }
  }
}