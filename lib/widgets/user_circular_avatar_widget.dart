import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';

class UserCircularAvt extends StatelessWidget {
  final String svgIcon;
  final String statusTxt;
  final File imageFile;
  final String networkImage;
  final Function onUploadPhoto;

  const UserCircularAvt({
    this.statusTxt,
    this.onUploadPhoto,
    this.imageFile,
    Key key,
    this.svgIcon = "assets/icons/User.svg",
    this.networkImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidthRation(120),
      height: getScreenHeightRation(120.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
        color: Color(0xFFF5F6F9),
        //shape: BoxShape.circle,
      ),
      //ClipOval(child: Image.file(imageFile,fit: BoxFit.cover,),)
      child: Material(
        elevation: 4.0,
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onUploadPhoto,
          child: imageFile != null ? Ink.image(image: FileImage(imageFile),fit: BoxFit.cover,) : networkImage != null ? CachedNetworkImage(
            imageUrl: networkImage,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ): Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgIcon,
                  color: custPrimaryColor,
                ),
                SizedBox(
                  height: getScreenHeightRation(5),
                ),
                Text(
                  statusTxt,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
