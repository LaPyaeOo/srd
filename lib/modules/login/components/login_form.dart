import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
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
