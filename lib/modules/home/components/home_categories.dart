import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/widgets/categories_button.dart';

class HomeCatergories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeightRation(60.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesButton(catTxt: 'Laravel',press: (){},),
          CategoriesButton(catTxt: 'Laravel',press: (){}),
          CategoriesButton(catTxt: 'Laravel',press: (){}),
          CategoriesButton(catTxt: 'Laravel',press: (){}),
          CategoriesButton(catTxt: 'Laravel',press: (){}),
          CategoriesButton(catTxt: 'Laravel',press: (){}),
          CategoriesButton(catTxt: 'Laravel',press: (){}),
        ],
      ),
    );
  }
}
