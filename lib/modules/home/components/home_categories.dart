import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/modules/categories/categories_view.dart';
import 'package:srd_frame/widgets/categories_button.dart';

class HomeCatergories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: getScreenHeightRation(60.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CategoriesButton(catTxt: 'Laravel',press: (){
              Navigator.pushNamed(context, CategoriesView.routeName);
            },),CategoriesButton(catTxt: 'Laravel',press: (){
              Navigator.pushNamed(context, CategoriesView.routeName);
            },),CategoriesButton(catTxt: 'Laravel',press: (){
              Navigator.pushNamed(context, CategoriesView.routeName);
            },),CategoriesButton(catTxt: 'Laravel',press: (){
              Navigator.pushNamed(context, CategoriesView.routeName);
            },),CategoriesButton(catTxt: 'Laravel',press: (){
              Navigator.pushNamed(context, CategoriesView.routeName);
            },),CategoriesButton(catTxt: 'Laravel',press: (){
              Navigator.pushNamed(context, CategoriesView.routeName);
            },),
          ],
        ),
      ),
    );
  }
}
