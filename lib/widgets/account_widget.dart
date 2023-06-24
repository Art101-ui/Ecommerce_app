import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget(
      {super.key, required this.appIcon, required this.bigText});

  final AppIcon appIcon;
  final BigText bigText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width10,
          ),
          bigText
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.2))
      ]),
    );
  }
}
