import'package:flutter/material.dart';
import 'components/register_body.dart';

class RegisterView extends StatelessWidget {
  static String routeName = './register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterBody(),
    );
  }
}
