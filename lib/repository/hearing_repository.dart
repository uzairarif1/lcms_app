import '../Data/network/baseAPI_services.dart';
import '../Data/network/networkAPI_services.dart';
import '../model/Auth_model.dart';
import '../model/HearingsModel.dart';
import '../res/app_urls.dart';
import '../view_model/user_viewmodel.dart';

class HearingRepository{
  final BaseApiServices _apiServices= NetworkApiService();

  Future<HearingsModel>getHearingAPI(UserViewModel userViewModel) async{
    try{

      final AuthModel userModel = await userViewModel.getUser();
      final String userId = userModel.userId.toString();

      dynamic response = await _apiServices.getGetApiResponse(
          '${AppURL.HearingURL}$userId');

      return HearingsModel.fromJson(response);
    }
    catch(e){
      throw e;
    }

  }
}