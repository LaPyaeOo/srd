import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'components/login_body.dart';

class LoginView extends StatelessWidget {
  static String routeName = '/login';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
      body: LoginBody(scaffoldKey: this.scaffoldKey,),
    );
  }
}
