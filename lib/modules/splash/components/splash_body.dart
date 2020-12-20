import 'package:flutter/material.dart';
import 'package:srd_frame/modules/login/login_view.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      //Navigator.pushNamed(context, LoginView.routeName);
      Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterLogo(size: 100.0,),
    );
  }
}
