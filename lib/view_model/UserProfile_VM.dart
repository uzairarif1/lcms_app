
import 'package:flutter/cupertino.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../Data/response/api_response.dart';

import '../model/Auth_model.dart';
import '../model/ClientNewModel.dart';
import '../model/ClientProfileDataModel.dart';


import '../repository/profile_repository.dart';

class Profile_vm with ChangeNotifier{
  final _repository = ProfileRepository();
  ApiResponse<ClientProfileDataModel> Profile = ApiResponse.loading();

  setList(ApiResponse<ClientProfileDataModel> response) {
    Profile = response;
    notifyListeners();
  }

  Future<void> fetchProfileListApi(UserViewModel userViewModel) async {

    setList(ApiResponse.loading());

    _repository.getProfileAPI(userViewModel).then((value) {

      setList(ApiResponse.completed(value));
    })
        .onError((error, stackTrace) {
      setList(ApiResponse.error(error.toString()));
    }
    );
  }

}

// Future<void> fetchProfileListApi(String userId) async {
  //
  //   setList(ApiResponse.loading());
  //
  //   _repository.getProfileAPI().then((value) {
  //
  //     setList(ApiResponse.completed(value));
  //   })
  //       .onError((error, stackTrace) {
  //     setList(ApiResponse.error(error.toString()));
  //   }
  //   );
  // }

