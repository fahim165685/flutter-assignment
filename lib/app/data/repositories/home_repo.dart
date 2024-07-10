import '../../app_pkg.dart';


class DashboardRepository {
  DashboardRepository({required this.homeProvider});
  final DashboardProvider homeProvider;

  Future<ApiResponse<List<ItemModel>?>?> getDate() async {
    try {
      final res = await homeProvider.getDate(ApiUrl.getDate);
      logInfo(res.statusCode);
      if (res.statusCode == AppConstants.kIsOk) {
        return ApiResponse.success(itemModelFromMap(res.body[AppConstants.kData]));
      } else {
        return  ApiResponse.error(res.body[AppConstants.kMessage]);
      }
    } on Exception catch (error) {
      logError('Get Item error :: $error');
      return ApiResponse.error(error.toString());
    }
  }


}
