import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/utilis/dimensions.dart';

class AppText extends StatelessWidget {
  AppText(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.iconData,
      required this.color});

  final TextEditingController controller;
  final String hintText;
  final IconData iconData;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              iconData,
              color: color,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                borderSide: BorderSide(width: 1.0, color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                borderSide: BorderSide(width: 1.0, color: Colors.white)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            )),
      ),
    );
  }
}
