

import '../Data/network/baseAPI_services.dart';
import '../Data/network/networkAPI_services.dart';
//import '../model/Cases.dart';
import '../model/Auth_model.dart';
import '../model/CasesModel.dart';
import '../res/app_urls.dart';
import '../view_model/user_viewmodel.dart';

class CaseRepository{
  final BaseApiServices _apiServices= NetworkApiService();

  Future<CasesModel>getCaseAPI(UserViewModel userViewModel) async{
    try{
      final AuthModel userModel = await userViewModel.getUser();
      final String userId = userModel.userId.toString();

      dynamic response = await _apiServices.getGetApiResponse(
          '${AppURL.caseURL}$userId');

      return CasesModel.fromJson(response);
    }
    catch(e){
      throw e;
    }

  }
}



// Future<CaseModel> getCaseAPI() async {
//   try {
//     dynamic response = await _apiServices.getGetApiResponse(AppURL.caseURL);
//     if (response != null && response['cases'] != null) {
//       return CaseModel(
//         pageName: response['page_name'],
//         cases: List<Cases>.from(response['cases'].map((caseJson) => Cases.fromJson(caseJson))),
//       );
//     } else {
//       throw Exception('Failed to load cases data');
//     }
//   }
//   catch (e) {
//     throw e;
//   }