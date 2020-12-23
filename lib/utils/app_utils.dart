import 'package:flutter/material.dart';
class AppUtils{
  static void showSnackBar(ScaffoldState state, {Color bgColor,String contentText}){
    state.showSnackBar(
      SnackBar(content: Text(contentText),duration: Duration(seconds: 2),)
    );
  }
}