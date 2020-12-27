import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'components/home_body.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: HomeBody(),
    );
  }
}
