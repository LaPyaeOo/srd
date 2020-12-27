import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/widgets/socialButton_widget.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';
import 'package:srd_frame/widgets/user_circular_avatar_widget.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  File _image;
  final picker = ImagePicker();

  Future getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }
      else{
        print('No image');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getScreenHeightRation(40),),
        UserCircularAvt(
          imageFile: _image,
          svgIcon: "assets/icons/User.svg",
          statusTxt: 'Upload\nphoto',
          onUploadPhoto: getImage,
        ),
        SizedBox(height: getScreenHeightRation(50),),
        buildNameField(),
        SizedBox(height: getScreenHeightRation(30),),
        buildEmailField(),
        SizedBox(height: getScreenHeightRation(30),),
        buildPasswordField(),
        SizedBox(height: getScreenHeightRation(30),),
        StylingButton(
          text: 'Sing Up',
          color: custPrimaryColor,
          onPress: (){

          },
        ),
        SizedBox(height: getScreenHeightRation(30),),
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
    );
  }
  TextFormField buildNameField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "User name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildEmailField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildPasswordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
