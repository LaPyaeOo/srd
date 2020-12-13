import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/widgets/header_button.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          HeaderButton(
            icon: 'assets/icons/Back_Icon.svg',
            onPressed: (){
              Navigator.of(context).pop(context);
            },
          ),
          SizedBox(width: getScreenWidthRation(105.0),),
          Text('Profile', style: TextStyle(fontSize: 18.0),),
        ],
      ),
    );
  }
}
