import 'package:flutter/material.dart';
import 'package:srd_frame/modules/login/login_view.dart';
import 'package:srd_frame/modules/login_success/login_succ_view.dart';

class AppRouting{
  final Map<String,WidgetBuilder>routes ={
    LoginView.routeName: (context)=> LoginView(),
    LoginSuccView.routeName: (context)=>LoginSuccView(),
  };
}