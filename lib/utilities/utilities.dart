import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  void toastMessage(String message, {required MaterialColor color}) {
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
  void button() {
  const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      side: MaterialStatePropertyAll(BorderSide(color: Colors.green)),
      overlayColor: MaterialStatePropertyAll(Colors.green));
}
}


