import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';

class CategoriesButton extends StatelessWidget {
  final Function press;
  final String catTxt;
  const CategoriesButton({this.press, @required this.catTxt, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        padding: EdgeInsets.all(getScreenWidthRation(15)),
        decoration: BoxDecoration(
          color: Color(0xFFFFECDF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(catTxt,)),
      ),
    );
  }
}
