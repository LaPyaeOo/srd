import 'package:flutter/material.dart';
import 'package:srd_frame/modules/login_screen/components/login_body.dart';

class AppRouting{
  final Map<String,WidgetBuilder>routes ={
    LoginBody.routeName: (context)=> LoginBody(),
  };
}