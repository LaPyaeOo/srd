import 'package:flutter/material.dart';

const custPrimaryColor = Color(0xFFFF7643);
const custPrimaryLightColor = Color(0xFFFFECDF);
const custSecondaryColor = Color(0xFF979797);
const custTextColor = Color(0xFF757575);
ThemeData themeData(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: custTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
AppBarTheme appBarTheme(){
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xFF8B8B8B),
        fontSize: 18.0,
      ),
    ),
  );
}
TextTheme textTheme(){
  return TextTheme(
    bodyText1: TextStyle(
      color: custTextColor,
    ),
    bodyText2: TextStyle(
      color: custTextColor,
    )
  );
}