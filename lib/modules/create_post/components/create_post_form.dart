import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';

class CreatePostForm extends StatefulWidget {
  @override
  _CreatePostFormState createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          buildPostPhotoField(),
          SizedBox(height: getScreenHeightRation(50),),
          buildPostTitleField(),
          SizedBox(height: getScreenHeightRation(30),),
          buildPostContentField(),
          SizedBox(height: getScreenHeightRation(30),),
          buildDrownDownButton(),
        ],
      ),
    );
  }
  Widget buildPostPhotoField(){
    return InkWell(
      onTap: (){},
      child: Container(
        width: double.infinity,
        height: getScreenHeightRation(250.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          color: Color(0xFFF5F6F9),
          //shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/Plus_Icon.svg',color: custPrimaryColor,),
            SizedBox(height: getScreenHeightRation(5),),
            Text('Post photo',textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
  TextFormField buildPostTitleField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Post title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  TextFormField buildPostContentField(){
    return TextFormField(
      maxLines: 4,
      minLines: 4,
      decoration: InputDecoration(
        hintText: "What's on your mind?",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  Widget buildDrownDownButton(){
    return DropdownButtonFormField(
        hint: Text('Select categories'),
        items: [
      DropdownMenuItem(child: Text('Dart'),value: 1,),
      DropdownMenuItem(child: Text('Java'),value: 2,),
      DropdownMenuItem(child: Text('PHP'),value: 3,),
    ], onChanged: (changedValue){
      
    });
  }
}
