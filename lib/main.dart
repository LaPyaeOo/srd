import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srd_frame/config/themes.dart';

import 'config/size_config.dart';
import 'modules/login_screen/login_view.dart';

void main(){
  runApp(
    MaterialApp(
      theme: themeData(),
      home: BlogApp(),
    )
  );
}

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginView();
  }
}
