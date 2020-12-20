import 'package:flutter/material.dart';
import 'package:srd_frame/config/app_routes.dart';
import 'package:srd_frame/config/themes.dart';
import 'modules/splash/splash_view.dart';

void main() {
  runApp(BlogApp());
}

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LoginView(),
      initialRoute: SplashView.routeName,
      routes: routes,
      theme: themeData(),
    );
  }
}
