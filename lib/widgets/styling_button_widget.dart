import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';

class StylingButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  const StylingButton({
    this.text,this.onPress,this.color, Key key
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenHeightRation(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getScreenWidthRation(18.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


