import 'package:flutter/material.dart';

import 'components/create_post_body.dart';

class CreatePostView extends StatelessWidget {
  static String routeName = './createPost';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CreatePostBody(),
    );
  }
}
