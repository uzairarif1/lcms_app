import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lcms_app/Data/response/status.dart';
import 'package:lcms_app/repository/login_repository.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../Utils/routeNames.dart';
import '../../model/Auth_model.dart';
import '../auth_viewmodel.dart';
class SplashServices {


  Future<AuthModel> getUserData() => UserViewModel().getUser();

  void checkAuth(BuildContext context) async {
    getUserData().then((value) async {
      if (value.userId.toString() == 'null' || value.userId.toString() == '') {
        await Future.delayed(Duration(seconds: 3));
        print('id:' + value.userId.toString());
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        print('id:' + value.userId.toString());
        Navigator.pushNamed(context, RouteNames.dashboard);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}





//
// final _loginRepository = loginRepository();
//
// void checkLogin(BuildContext context) async {
//   try {
//     final loginModel = await _loginRepository.getloginAPI();
//
//     if (loginModel.message.toString() == 'Already logged in') {
//       await Future.delayed(Duration(seconds: 3));
//       Navigator.pushNamed(context, RouteNames.dashboard);
//     } else {
//       await Future.delayed(Duration(seconds: 3));
//       Navigator.pushNamed(context, RouteNames.login);
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print('Errooor: $e');
//     }
//     // Handle the error condition (e.g., show an error message, navigate to an error screen)
//   }
// }