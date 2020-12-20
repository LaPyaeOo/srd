import 'package:flutter/material.dart';

import 'components/profile_body.dart';

class ProfileView extends StatelessWidget {
  static String routeName = './profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(),
    );
  }
}
