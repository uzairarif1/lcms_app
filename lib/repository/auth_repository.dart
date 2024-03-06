
import 'package:lcms_app/Data/network/baseAPI_services.dart';
import 'package:lcms_app/Data/network/networkAPI_services.dart';
import 'package:lcms_app/res/app_urls.dart';

class AuthRepository{

  BaseApiServices _apiServices= NetworkApiService();

  Future <dynamic> loginAPI(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppURL.authURL, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }


}
//
//
// Future<dynamic> checkLoginStatus() async {
//   try {
//     dynamic response = await _apiServices.getGetApiResponse(AppURL.checkLoginURL);
//     return response;
//   } catch (e) {
//     throw e;
//   }
// }