import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/modules/profile/components/profile_content.dart';
import 'package:srd_frame/modules/profile/components/profile_header.dart';


class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: getScreenHeightRation(10.0),
            ),
            ProfileHeader(),
            SizedBox(height: getScreenHeightRation(30.0),),
            Expanded(child: ProfileContent()),
          ],
        ));
  }
}
