import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';

class Post extends StatelessWidget {
  final Function onTap;
  final String postTitle;
  final String uploadDateTime;
  final String postContent;
  const Post({this.onTap,this.postTitle,this.postContent,this.uploadDateTime,Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: double.infinity,
              height: getScreenHeightRation(80.0),
              child: SvgPicture.asset('assets/icons/Plus_Icon.svg',color: custPrimaryColor,),
            ),
          ),
          SizedBox(
            height: getScreenHeightRation(30.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postTitle,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  uploadDateTime,
                ),
                SizedBox(
                  height: getScreenHeightRation(10.0),
                ),
                Text(
                  postContent,
                ),
              ],),
          )
        ],
      ),
    );
  }
}
