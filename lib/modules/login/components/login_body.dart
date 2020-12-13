import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/modules/login/components/login_form.dart';
import 'package:srd_frame/widgets/socialButton_widget.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidthRation(20.0)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getScreenWidthRation(28.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  LoginForm(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: "assets/icons/google.svg",
                        tap: () {},
                      ),
                      SocialButton(
                        icon: "assets/icons/facebook.svg",
                        tap: () {},
                      ),
                      SocialButton(
                        icon: "assets/icons/twitter.svg",
                        tap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
