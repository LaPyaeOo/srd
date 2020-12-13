import 'package:flutter/material.dart';

import 'components/profile_body.dart';

class ProfileView extends StatelessWidget {
  static String routName = './profileName';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(),
    );
  }
}
