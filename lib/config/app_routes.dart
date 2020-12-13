import 'package:flutter/material.dart';
import 'package:srd_frame/modules/create_post/create_post_view.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/modules/login/login_view.dart';
import 'package:srd_frame/modules/profile/profile_view.dart';
import 'package:srd_frame/modules/register/register_view.dart';

final Map<String, WidgetBuilder> routes = {
  LoginView.routeName: (context) => LoginView(),
  RegisterView.routeName: (context) => RegisterView(),
  HomeView.routeName: (context) => HomeView(),
  CreatePostView.routeName: (context) => CreatePostView(),
  ProfileView.routName: (context)=> ProfileView(),
};
