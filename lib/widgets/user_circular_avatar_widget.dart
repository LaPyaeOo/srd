import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';

class UserCircularAvt extends StatelessWidget {
  final String svgIcon;
  final String statusTxt;
  final Function onUploadPhoto;
  const UserCircularAvt({this.statusTxt,this.onUploadPhoto,Key key,@required this.svgIcon,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onUploadPhoto,
      child: Container(
        width: double.infinity,
        height: getScreenHeightRation(100.0),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgIcon,color: custPrimaryColor,),
            SizedBox(height: getScreenHeightRation(5),),
            Text(statusTxt,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
