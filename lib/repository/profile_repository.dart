


import '../Data/network/baseAPI_services.dart';
import '../Data/network/networkAPI_services.dart';
import '../model/Auth_model.dart';
import '../model/ClientNewModel.dart';
import '../model/ClientProfileDataModel.dart';

import '../res/app_urls.dart';
import '../view_model/user_viewmodel.dart';

class ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<ClientProfileDataModel> getProfileAPI(UserViewModel userViewModel) async {
    try {
      final AuthModel userModel = await userViewModel.getUser();
      final String userId = userModel.userId.toString();

      //print(userId);
      dynamic response = await _apiServices.getGetApiResponse(
        '${AppURL.profileURL}$userId',
      );
      return ClientProfileDataModel.fromJson(response);
    } catch (e) {
      print('Errorr: $e'); // Print the error message for debugging
      throw e;
    }
  }
}



// Future <UserProfileModel> getProfileAPI() async{
  //   try{
  //     dynamic response = await _apiServices.getGetApiResponse(AppURL.profileURL);
  //     return UserProfileModel.fromJson(response);
  //   }
  //   catch(e){
  //     throw e;
  //   }
  //
  // }
