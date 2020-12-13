import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/modules/register/components/register_form.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidthRation(20.0)),
        child: Column(
          children: [
            SizedBox(height: getScreenWidthRation(10.0),),
            Text('Register Account',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),),
            SizedBox(
              height: getScreenHeightRation(10.0),
            ),
            Text('Complete your detail or \n continue with social media',textAlign: TextAlign.center,),
            RegisterForm(),
            SizedBox(
              height: getScreenHeightRation(20.0),
            ),
            Text('By continuing your confirm that you agree\n with our Term and Contidion',textAlign: TextAlign.center,),
          ],
        ),
      ),
    ));
  }
}
