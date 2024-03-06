import '../Data/network/baseAPI_services.dart';
import '../Data/network/networkAPI_services.dart';
import '../model/Auth_model.dart';
import '../model/LogoutModel.dart';
import '../res/app_urls.dart';
import '../view_model/user_viewmodel.dart';

class logoutRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  Future<LogoutModel> getlogoutAPI() async {
    try {
      // final AuthModel userModel = await userViewModel.getUser();
      // final String userId = userModel.userId.toString();
      dynamic response = await _apiServices.getGetApiResponse(
        AppURL.logoutURL,
      );
      print(
          'Response: $response'); // Print the response to check if it's null or not
      return LogoutModel.fromJson(response);
    } catch (e) {
      print('Error: $e'); // Print the error message for debugging
      throw e;
    }
  }
}
