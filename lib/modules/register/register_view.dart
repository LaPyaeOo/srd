import'package:flutter/material.dart';
import 'components/register_body.dart';

class RegisterView extends StatelessWidget {
  static String routeName = './register';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //const RegisterView({Key key,this.scaffoldKey}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: RegisterBody(scaffoldKey: this.scaffoldKey,),
    );
  }
}
