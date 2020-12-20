import 'package:flutter/material.dart';
import 'package:srd_frame/widgets/post_widget.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
          Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
          Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
          Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
        ],),
      ),
    );
  }
}
