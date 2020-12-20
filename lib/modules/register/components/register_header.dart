import 'package:flutter/material.dart';
import 'package:srd_frame/widgets/header_button.dart';

class RegisterHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          HeaderButton(
            icon: 'assets/icons/Back_Icon.svg',
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
        ],
      ),
    );
  }
}
