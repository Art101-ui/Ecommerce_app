// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/small_text.dart';

class NoDataPage extends StatelessWidget {
  final IconData icon;

  final String text;

  const NoDataPage({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: AppColors.textColor,
        ),
        SizedBox(
          height: 10,
        ),
        BigText(
          text: text,
          size: 25,
          color: AppColors.textColor,
        )
      ],
    );
  }
}
