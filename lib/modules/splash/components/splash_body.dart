import 'package:flutter/material.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/modules/login/login_view.dart';
import 'package:srd_frame/utils/services/shared_preferences.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),()async{
      await SharedPrefService.getStringData(key: SharedPrefService.token).then((tokenValue){
        if(tokenValue != null && tokenValue != 'null'){
          print('PassTokenValue =>=>=> $tokenValue');
          Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName, (route) => false);
          //Navigator.pushNamed(context, LoginView.routeName);
        }
        else{
          print('ErrorTOkenValue =>=>=> ${tokenValue.toString()}');
          Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterLogo(size: 100.0,),
    );
  }
}
