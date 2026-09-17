
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 20,
    );
  }

  static void flushBarErrorMessage(String message,BuildContext context) {
    Flushbar(
      message: message,
      padding: EdgeInsets.all(15),
      forwardAnimationCurve: Curves.decelerate,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      margin: const EdgeInsets.all(20),
      positionOffset: 20,

      borderRadius: BorderRadius.circular(10),
      icon: const Icon(
        Icons.error_outline,
        size: 28,
        color: Colors.white,
      ),
    ).show(context);
  }

  static void snackBar(String message,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

}