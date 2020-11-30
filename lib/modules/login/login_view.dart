import 'package:flutter/material.dart';
import 'components/login_body.dart';

class LoginView extends StatelessWidget {
  static String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginBody(),
    );
  }
}
