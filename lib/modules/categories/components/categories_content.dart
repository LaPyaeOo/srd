import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/widgets/post_widget.dart';

class CategoriesContent extends StatefulWidget {
  @override
  _CategoriesContentState createState() => _CategoriesContentState();
}

class _CategoriesContentState extends State<CategoriesContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          Text('Your posts', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),),
          Container(
            height: getScreenHeightRation(400.0),
            child: ListView(
              children: [
                Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
                Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
                Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
                Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
