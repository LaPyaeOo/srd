import'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';

import 'components/register_body.dart';

class RegisterView extends StatelessWidget {
  static String routeName = './register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: RegisterBody(),
    );
  }
}
