import 'package:flutter/material.dart';

class CommonHelper {
  static void showMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text(message));
        });
  }

  static dynamic moveScreen(BuildContext context, Widget widget) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }
}
