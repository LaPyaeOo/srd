import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'home_categories.dart';
import 'home_header.dart';
import 'news_feed.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getScreenHeightRation(10.0),),
          HomeHeader(),
          SizedBox(height: getScreenHeightRation(30.0),),
          HomeCatergories(),
          SizedBox(height: getScreenHeightRation(10.0),),
          NewsFeed(),
        ],
      ),
    );
  }
}
