import 'dart:async'; 
import 'package:flutter/material.dart';
import '../session/session_controller.dart';
import '../utils/routers/routes_name.dart'; 

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      if (SessionController.isLogin ?? false) {
        Timer(
          const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
      );
    });
  }
}
