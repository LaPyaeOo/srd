import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/modules/login/components/login_bloc.dart';
import 'package:srd_frame/modules/login_success/login_succ_view.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  String email;
  String password;

  LoginBloc loginBloc;
  
  @override
  void initState() {
    loginBloc = LoginBloc();
    loginBloc.loginStream().listen((ResponseObj responseObj) {
      if(responseObj.message == MsgState.data){
        Navigator.of(context).pushNamed(LoginSuccView.routeName);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailField(),
          SizedBox(height: getScreenHeightRation(30),),
          buildPasswordField(),
          SizedBox(height: getScreenHeightRation(30),),
          Row(
            children: [
              Checkbox(value: remember,activeColor: custPrimaryColor, onChanged: (value){
                setState(() {
                  remember =value;
                });
              }),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: (){},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getScreenHeightRation(20),
          ),
          StylingButton(
            text: "Continue",
            onPress: (){
              print('LoginButton');
              loginBloc.loginReq({
                "email": "mtk@gmail.com",
                "password": "password",
              });
              loginBloc.loginStream().listen((ResponseObj responseObj) {
                if(responseObj.message == MsgState.data){
                  Navigator.of(context).pushNamed(LoginSuccView.routeName);
                }
              });
            },
          ),
        ],
      ),
    );
  }
  TextFormField buildEmailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        email = value;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildPasswordField(){
    return TextFormField(
      obscureText: false,
      onSaved: (value){
        password = value;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
