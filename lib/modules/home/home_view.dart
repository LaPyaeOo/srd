import 'package:flutter/material.dart';
import 'components/home_body.dart';

class HomeView extends StatelessWidget {
  static String name;
  static String routeName = './home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeBody(),
    );
  }
}
