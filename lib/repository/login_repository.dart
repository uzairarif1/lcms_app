import '../Data/network/baseAPI_services.dart';
import '../Data/network/networkAPI_services.dart';
import '../model/LoginModel.dart';
import '../res/app_urls.dart';

class loginRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<LoginModel> getloginAPI() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppURL.checkLoginURL);
     print('Response: $response');
      if (response == null) {
        throw Exception('Empty response');
      }
      // Check if the response has the expected "message" field
      if (response['message'] == null) {
        throw Exception('Invalid response format');
      }

      return LoginModel.fromJson(response);
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
