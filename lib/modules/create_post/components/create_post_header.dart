import 'package:flutter/material.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/widgets/header_button.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';

class CreatePostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderButton(
            icon: 'assets/icons/Back_Icon.svg',
            onPressed: (){
              Navigator.of(context).pop(context);
            },
          ),
          Text('Create Post', style: TextStyle(fontSize: 18.0),),
          Container(
            height: getScreenHeightRation(50),
            width: getScreenWidthRation(80.0),
            child: StylingButton(
              text: 'Post',
              onPress: (){},
              color: custPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
