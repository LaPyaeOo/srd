import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/modules/register/components/register_bloc.dart';
import 'package:srd_frame/utils/app_utils.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/widgets/socialButton_widget.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';
import 'package:srd_frame/widgets/user_circular_avatar_widget.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<ScaffoldState>scaffoldKey;
  const RegisterForm({Key key,this.scaffoldKey}): super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final _formKey = GlobalKey<FormState>();
  RegisterBloc registerBloc;
  TextEditingController nameTxtC = TextEditingController();
  TextEditingController emailTxtC = TextEditingController();
  TextEditingController passCodeTxtC = TextEditingController();
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
  TextFormField buildNameField(){
    return TextFormField(
      controller: nameTxtC,
      decoration: InputDecoration(
        labelText: "User name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildEmailField(){
    return TextFormField(
      controller: emailTxtC,
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
      obscureText: true,
      controller: passCodeTxtC,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  @override
  void initState() {
    registerBloc = RegisterBloc();
    registerBloc.registerStream().listen((ResponseObj resp) {
      if(resp.message == MsgState.data){
        Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName, (route) => false);
      }
      if(resp.message == MsgState.error){
        AppUtils.showSnackBar(widget.scaffoldKey.currentState,contentText: 'Something Wrong', bgColor: Colors.red);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key:  _formKey,
      child: Column(
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
              checkRegister();
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
      ),
    );
  }
  checkRegister(){
    print('Check register');
    if(nameTxtC.text.isEmpty || emailTxtC.text.isEmpty || passCodeTxtC.text.isEmpty){
      AppUtils.showSnackBar(widget.scaffoldKey.currentState,contentText: 'Fill all fields', bgColor: Colors.red);
    }
    else if(_image == null){
      AppUtils.showSnackBar(widget.scaffoldKey.currentState,contentText: 'Select profile picture', bgColor: Colors.red);
    }
    else{
      Map<String, dynamic> map ={
        'email': emailTxtC.text,
        'password': passCodeTxtC.text,
        'name': nameTxtC.text,
      };
      registerBloc.registerReq(map,_image);
    }
  }
  @override
  void dispose() {
    registerBloc.closeRegBloc();
    super.dispose();
  }
}
