
import 'package:flutter/cupertino.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';

import '../Data/response/api_response.dart';

//import '../model/Cases.dart';
import '../model/CasesModel.dart';
import '../repository/case_repository.dart';


class Cases_VM with ChangeNotifier {

  final _repository = CaseRepository();
  ApiResponse<CasesModel> CasesList = ApiResponse.loading();

  setList(ApiResponse<CasesModel> response) {
    CasesList = response;
    notifyListeners();
  }
  Future<void> fetchListApi(UserViewModel userViewModel) async {
    setList(ApiResponse.loading());

    _repository.getCaseAPI(userViewModel).then((value) {
      setList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setList(ApiResponse.error(error.toString()));
    });
  }
}