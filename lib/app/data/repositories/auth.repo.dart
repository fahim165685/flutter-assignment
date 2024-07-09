import '../../app_pkg.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<ApiResponse<UserResponse>?> login(LoginRequest data) async {
    try {
      final res = await authProvider.login(ApiUrl.signInPost, data);
      if (res.body[AppConstants.kSuccess] == true) {
        StorageService.setString(StorageConstants.accessToken,
            res.body[AppConstants.kAuthorisation][AppConstants.kToken]);
        return ApiResponse.success(
            UserResponse.fromMap(res.body[AppConstants.kData]));
      } else {
        return  ApiResponse.error(res.body[AppConstants.kMessage]);
      }
    } on Exception catch (error) {
      logError('Login error :: $error');
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<UserResponse>?> register(RegisterRequest data) async {
    try {
      final res = await authProvider.register(ApiUrl.signUpPost, data);
      if (res.body[AppConstants.kSuccess]) {
        StorageService.setString(StorageConstants.accessToken, res.body[AppConstants.kToken]);
        return ApiResponse.success(UserResponse.fromMap(res.body));
      } else {
        return ApiResponse.error(res.body[AppConstants.kMessage]);
      }
    } on Exception catch (error) {
      logError(error);
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<String>?> logoutUser() async {
   try{
     final res = await authProvider.logout(ApiUrl.logOutPost);
     if (res.body[AppConstants.kSuccess]==true) {
       return ApiResponse.success(AppConstants.kMessage);
     }else{
       return ApiResponse.error(res.body[AppConstants.kMessage]);
     }
   }on Exception catch(error){
     logError('post user logout $error');
   }
   return null;
  }
}
