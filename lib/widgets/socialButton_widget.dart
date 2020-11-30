import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srd_frame/config/size_config.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final Function tap;
  const SocialButton({
    this.icon,
    this.tap,
    Key key,
}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getScreenWidthRation(10.0)),
        padding: EdgeInsets.all(getScreenWidthRation(12.0)),
        height: getScreenHeightRation(40.0),
        width: getScreenWidthRation(40.0),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
