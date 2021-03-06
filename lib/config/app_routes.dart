import 'package:flutter/material.dart';
import 'package:srd_frame/modules/categories/categories_view.dart';
import 'package:srd_frame/modules/create_post/create_post_view.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/modules/login/login_view.dart';
import 'package:srd_frame/modules/profile/profile_view.dart';
import 'package:srd_frame/modules/register/register_view.dart';
import 'package:srd_frame/modules/splash/splash_view.dart';

final Map<String, WidgetBuilder> routes = {
  SplashView.routeName: (context)=>SplashView(),
  LoginView.routeName: (context) => LoginView(),
  RegisterView.routeName: (context) => RegisterView(),
  HomeView.routeName: (context) => HomeView(),
  CreatePostView.routeName: (context) => CreatePostView(),
  ProfileView.routeName: (context)=> ProfileView(),
  CategoriesView.routeName: (context)=> CategoriesView(),
};
