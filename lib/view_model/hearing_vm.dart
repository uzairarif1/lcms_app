
import 'package:flutter/cupertino.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';

import '../Data/response/api_response.dart';
import '../model/HearingsModel.dart';
import '../repository/hearing_repository.dart';

class Hearing_VM with ChangeNotifier{
  final _repository = HearingRepository();
  ApiResponse<HearingsModel> HearingsList = ApiResponse.loading();

  setList(ApiResponse<HearingsModel> response) {
    HearingsList = response;
    notifyListeners();
  }
  Future<void> fetchListApi(UserViewModel userViewModel) async {
    setList(ApiResponse.loading());

    _repository.getHearingAPI(userViewModel).then((value) {
      setList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setList(ApiResponse.error(error.toString()));
    });
  }

}