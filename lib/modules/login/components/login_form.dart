import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/modules/login/components/login_bloc.dart';
import 'package:srd_frame/modules/login/login_view.dart';
import 'package:srd_frame/modules/register/register_view.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/shared_preferences.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc loginBloc;
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  TextEditingController emailTxC = TextEditingController(text: 'mtk@gmail.com');
  TextEditingController passTxC = TextEditingController(text: 'password');
  String email;
  String password;
  Map<String, dynamic> loginDBody;

  
  @override
  void initState() {
    email = emailTxC.text;
    password = passTxC.text;
    loginBloc = LoginBloc();
    loginBloc.loginStream().listen((ResponseObj resObj) {
      if(resObj.message == MsgState.data){
        SharedPrefService.getStringData(key: SharedPrefService.token).then((tokenValue){
          if(tokenValue.toString() != 'null' || tokenValue != null){
            Navigator.pushNamed(context, HomeView.routeName);
          }
          else{
            Navigator.pushNamed(context, LoginView.routeName);
          }
        });
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
            height: getScreenHeightRation(20.0),
          ),
          StylingButton(
            text: "Login",
            color: custPrimaryColor,
            onPress: (){
               email=emailTxC.text;
               print(email);
               password = passTxC.text;
               print(password);
               loginDBody = {
                 'email': email,
                 'password': password
               };
               loginBloc.loginReq(loginDBody);
            },
          ),
          SizedBox(
            height: getScreenHeightRation(20.0),
          ),
          StylingButton(
            text: 'Register',
            color: custSecondaryColor,
            onPress: (){
              Navigator.pushNamed(context, RegisterView.routeName);
            },
          ),
        ],
      ),
    );
  }
  TextFormField buildEmailField(){
    return TextFormField(
      controller: emailTxC,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildPasswordField(){
    return TextFormField(
      controller: passTxC,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
