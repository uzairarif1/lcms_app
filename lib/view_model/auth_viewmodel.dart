
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lcms_app/Utils/routeNames.dart';
import 'package:lcms_app/Utils/utils.dart';
import 'package:lcms_app/model/Auth_model.dart';
import 'package:lcms_app/repository/auth_repository.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';



class AuthViewModel with ChangeNotifier{

  final _myrepository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data , BuildContext context) async {

    setLoading(true);

    _myrepository.loginAPI(data).then((value){
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
          AuthModel(
              message: value['message'],
              userId: value['user_id']
              //token: value['token'],
          )
      );
      utilities.flushBarErrorSuccessMessage('Login Successfully', context);
      Navigator.pushNamed(context, RouteNames.dashboard);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setLoading(false);
      utilities.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }



}

