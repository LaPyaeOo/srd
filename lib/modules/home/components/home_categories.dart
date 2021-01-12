import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/modules/categories/categories_view.dart';
import 'package:srd_frame/modules/home/components/home_bloc.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/widgets/categories_button.dart';

import 'home_category_object.dart';

class HomeCatergories extends StatefulWidget {
  @override
  _HomeCatergoriesState createState() => _HomeCatergoriesState();
}

class _HomeCatergoriesState extends State<HomeCatergories> {

  HomeBloc _bloc;

  @override
  void initState() {
    _bloc = HomeBloc();
    _bloc.homeCategoryRequest();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: getScreenHeightRation(60.0),
        child: StreamBuilder(
          stream: _bloc.homeStream(),
          initialData: ResponseObj(message: MsgState.loading),
          builder: (context, snapshot) {
            ResponseObj responseObj = snapshot.data;
            if(responseObj.message == MsgState.loading){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(responseObj.message == MsgState.data){
              List<CategoryOb> list = responseObj.data;
              print('This is Home Object list =>=>=> $list');
              return ListView(
                scrollDirection: Axis.horizontal,
                  children: list.map((e) {
                    return CategoriesButton(
                      catTxt: e.name,
                      press: () {
                        Navigator.pushNamed(context, CategoriesView.routeName);
                      },
                    );
                  }).toList(),
                  //[
                  // CategoriesButton(catTxt: 'Laravel',press: (){
                  //   Navigator.pushNamed(context, CategoriesView.routeName);
                  // },),CategoriesButton(catTxt: 'Laravel',press: (){
                  //   Navigator.pushNamed(context, CategoriesView.routeName);
                  // },),CategoriesButton(catTxt: 'Laravel',press: (){
                  //   Navigator.pushNamed(context, CategoriesView.routeName);
                  // },),CategoriesButton(catTxt: 'Laravel',press: (){
                  //   Navigator.pushNamed(context, CategoriesView.routeName);
                  // },),CategoriesButton(catTxt: 'Laravel',press: (){
                  //   Navigator.pushNamed(context, CategoriesView.routeName);
                  // },),
                  //],
              );
            }
            else{
              return Center(child: Text('Error'),);
            }
        },)
      ),
    );
  }
  @override
  void dispose() {
    _bloc.homeCategoryRqClose();
    super.dispose();
  }
}

