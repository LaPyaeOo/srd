import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/utils/helpers/null_checker.dart';

class Post extends StatelessWidget {
  final Function onTap;
  final String postTitle;
  final String postCategory;
  final String uploadDateTime;
  final String image;
  final String postContent;
  const Post({this.onTap,this.postTitle,this.postCategory,this.postContent,this.uploadDateTime,this.image,});
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
            child: NullEmptyChecker.checkVar(image)?Container(
              width: double.infinity,
              height: getScreenHeightRation(80.0),
              child: SvgPicture.asset('assets/icons/Plus_Icon.svg',color: custPrimaryColor,),
            ):Container(
              width: double.infinity,
              height: getScreenHeightRation(80.0),
              // decoration: BoxDecoration(
              //   image: DecorationImage(image: NetworkImage(image)),
              // ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getScreenHeightRation(30.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                SizedBox(
                  width: getScreenWidthRation(20.0),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFFFECDF),
                  ),
                  child: Text(
                    postCategory,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
