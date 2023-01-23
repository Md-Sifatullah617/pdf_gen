import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  void toastMessage(String message,{required MaterialColor color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
