import 'package:flutter/material.dart';

import 'components/splash_body.dart';

class SplashView extends StatelessWidget {
  static String routeName = './splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Text('H'),
      // ),
      body: SplashBody(),
    );
  }
}
