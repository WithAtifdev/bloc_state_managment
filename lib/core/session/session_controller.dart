import 'dart:convert'; 
import 'package:flutter/material.dart'; 
import '../../features/auth/model/user_model.dart';
import '../storage/local_storage.dart'; 

/// A singleton class for managing user session data.
class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();
  /// Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  
  static bool? isLogin;
  static UserModel user = UserModel();

  /// Private constructor for creating the singleton instance of [SessionController].
  SessionController._internal() {
    isLogin = false;
  }

  //In Dart, a factory constructor is a special kind of constructor that can return an instance of the class,
  /// Factory constructor for accessing the singleton instance of [SessionController].
  factory SessionController() {
    return _session;
  }

  /// Saves user data into the local storage.
  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    sharedPreferenceClass.setValue('isLogin', 'true');
  }

  /// Retrieves user data from the local storage.
  Future<void> getUserFromPreference() async {
    try {
      String userData = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController.user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
