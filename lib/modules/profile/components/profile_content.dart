import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';
import 'package:srd_frame/widgets/user_circular_avatar_widget.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          buildProfileField(),
          SizedBox(height: getScreenHeightRation(20.0),),
          Text('Your posts', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0
          ),),
          Container(
            height: getScreenHeightRation(400.0),
            child: ListView(
              children: [
                buildOwnerPostField(),
                buildOwnerPostField(),
                buildOwnerPostField(),
                buildOwnerPostField(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildProfileField() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: getScreenHeightRation(250.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          color: custSecondaryColor.withOpacity(0.4),
          //shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserCircularAvt(
              svgIcon: 'assets/icons/User.svg',
              statusTxt: '',
              onUploadPhoto: () {},
            ),
            SizedBox(
              height: getScreenHeightRation(5),
            ),
            Text(
              'Mg Mg \n \n mgmg@gmail.com',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getScreenHeightRation(20.0),),
            buildLogOutButton(),
          ],
        ),
      ),
    );
  }
  Widget buildOwnerPostField() {
    return Container(
      margin: EdgeInsets.only(bottom: getScreenHeightRation(20.0)),
      width: double.infinity,
      height: getScreenHeightRation(200.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
        color: custSecondaryColor.withOpacity(0.4),
        //shape: BoxShape.circle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: getScreenHeightRation(100.0),
            child: SvgPicture.asset('assets/icons/Plus_Icon.svg',color: custPrimaryColor,),
          ),
          SizedBox(
            height: getScreenHeightRation(30.0),
          ),
          Text(
            'Title',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: getScreenHeightRation(10.0),
          ),
          Text(
            'Hello Hi',
          ),
        ],
      ),
    );
  }
  Widget buildLogOutButton(){
    return Container(
      width: getScreenWidthRation(120.0),
      height: getScreenHeightRation(40.0),
      child: StylingButton(
        onPress: (){},
        text: 'Logout',
        color: custPrimaryColor.withOpacity(0.4),
      ),
    );
  }
}
