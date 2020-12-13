import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';

import 'create_post_form.dart';
import 'create_post_header.dart';

class CreatePostBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: getScreenHeightRation(10.0),
        ),
        CreatePostHeader(),
        SizedBox(
          height: getScreenHeightRation(30.0),
        ),
        CreatePostForm(),
      ],
    ));
  }
}
