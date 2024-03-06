
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcms_app/View/Case_View.dart';
import 'package:lcms_app/View/Doc_Case_view.dart';
import 'package:lcms_app/View/Hearing_View.dart';
import 'package:lcms_app/View/Profile_View.dart';
import 'package:lcms_app/View/login_view.dart';
import 'package:lcms_app/View/splash_view.dart';
import '../View/UploadDocument_View.dart';
import '../view_model/user_viewmodel.dart';
import 'routeNames.dart';
import 'package:lcms_app/View/dash_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const loginScreen());

        case RouteNames.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  DashboardScreen());


      case RouteNames.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  SplashScreen());

      case RouteNames.cases:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CaseView());

      case RouteNames.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const ProfileScreen());

      case RouteNames.hearings:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const HearingScreen());

      case RouteNames.documentScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>   DocumentCaseScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}