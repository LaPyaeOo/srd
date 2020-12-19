import 'package:flutter/material.dart';
import 'package:srd_frame/modules/create_post/create_post_view.dart';
import 'package:srd_frame/modules/profile/profile_view.dart';
import 'package:srd_frame/widgets/header_button.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderButton(
            icon: 'assets/icons/User.svg',
            onPressed: (){
              Navigator.pushNamed(context, ProfileView.routeName);
            },
          ),
          Text('Home Blog', style: TextStyle(fontSize: 18.0),),
          HeaderButton(
            icon: 'assets/icons/Plus_Icon.svg',
            onPressed:(){
              Navigator.pushNamed(context, CreatePostView.routeName);
            },
          )
        ],
      ),
    );
  }
}
