import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Auth_model.dart';


class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(AuthModel usermodel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('message', usermodel.message.toString());
    sp.setInt('user_id', usermodel.userId!.toInt());
    //sp.setString('token', usermodel.token ?? '');
    notifyListeners();
    return true;
  }

  Future<AuthModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? message = sp.getString('message');
    final int? userId = sp.getInt('user_id');
    //final int? userId = userIdString != null ? int.tryParse(userIdString) : null;
    //final String? token = sp.getString('token');

    return AuthModel(
      message: message,
      userId: userId,
      //token: token
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('message');
    sp.remove('user_id');
    //sp.remove('token');
    return true;
  }


}

//
// Future<bool> isLoggedIn() async {
//   final SharedPreferences sp = await SharedPreferences.getInstance();
//   final String? userIdString = sp.getString('user_id');
//   final int? userId = userIdString != null ? int.tryParse(userIdString) : null;
//   return userId != null;
// }