import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';


class HeaderButton extends StatelessWidget {
  final String icon;
  final Function onPressed;
  const HeaderButton({@required this.icon,this.onPressed,Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(getScreenWidthRation(12.0)),
        height: getScreenWidthRation(50),
        width: getScreenWidthRation(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: custSecondaryColor.withOpacity(0.3),
          shape: BoxShape.rectangle,
        ),
        child: IconButton(
          icon: SvgPicture.asset(icon),
          onPressed: onPressed,
        )
    );
  }
}
