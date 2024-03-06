import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lcms_app/repository/logout_repository.dart';
import 'package:lcms_app/res/colors.dart';
import 'package:lcms_app/utils/routes.dart';
import 'package:lcms_app/view_model/UserProfile_VM.dart';
import 'package:lcms_app/view_model/auth_viewmodel.dart';
import 'package:lcms_app/view_model/cases_vm.dart';
import 'package:lcms_app/view_model/document_viewmodel.dart';
import 'package:lcms_app/view_model/hearing_vm.dart';
import 'package:lcms_app/view_model/logout_vm.dart';
import 'package:lcms_app/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'View/splash_view.dart';
import 'package:lcms_app/Utils/routeNames.dart';
import 'View/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthViewModel()),
      ChangeNotifierProvider(create: (_)=> UserViewModel()),
      ChangeNotifierProvider(create: (_)=> Cases_VM()),
      ChangeNotifierProvider(create: (_)=> Profile_vm()),
      ChangeNotifierProvider(create: (_)=> LogoutVM()),
      ChangeNotifierProvider(create: (_)=> Hearing_VM()),
      ChangeNotifierProvider(create: (_)=> UploadDocViewModel())
    ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF2E5090),
              titleTextStyle: TextStyle(fontFamily: 'Roboto_Slab_Bold')
                //elevation: .2, systemOverlayStyle: SystemUiOverlayStyle.light,
            )
        ),
        initialRoute: RouteNames.splash,
        onGenerateRoute: Routes.generateRoute,
      ),

    );
      

  }
}


