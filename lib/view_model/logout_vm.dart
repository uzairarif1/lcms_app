
import 'package:flutter/foundation.dart';
import 'package:lcms_app/Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:lcms_app/model/LogoutModel.dart';
import 'package:lcms_app/repository/logout_repository.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../Data/response/api_response.dart';
import '../Utils/routeNames.dart';
import '../model/Auth_model.dart';

class LogoutVM with ChangeNotifier {

  final _repository = logoutRepository();
  //UserViewModel userViewModel = UserViewModel();
  bool _loading = false;


  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> logoutApi(BuildContext context) async {
    setLoading(true);
    _repository.getlogoutAPI().then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.remove();
    });
    utilities.flushBarErrorSuccessMessage('Logout Successfully', context);
    Navigator.pushNamed(context, RouteNames.login);


  }

//
    // setLoading(false);
    // utilities.flushBarErrorMessage(error.toString(), context);
    //

}

  // Future<void> getUserLoggedout() async{
  //   _repository.getlogoutAPI().then((value) {
  //     Navigator.pushNamed(context, RouteNames.login);
  //   });
  //
  // }


