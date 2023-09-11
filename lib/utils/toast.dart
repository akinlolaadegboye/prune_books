import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prune/extensions/exception.dart';

class Toastt {

  static Future<bool?> showError(Exception? error, {Toast length = Toast.LENGTH_SHORT}){
    if(error != null && error.hasMessage) {
      return _showMessage(error.message, length: length);
    }
    return Future.value(false);
  }

  static Future<bool?> showMessage(String? message, {Toast length = Toast.LENGTH_SHORT}){
    if(message != null) {
      return _showMessage(message!, length: length);
    }
    return Future.value(false);
  }

  static Future<bool?> _showMessage(String message, {Toast length = Toast.LENGTH_SHORT}){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}