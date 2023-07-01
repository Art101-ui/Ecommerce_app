import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/utilis/dimensions.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.iconData,
      this.isObscure = false,
      required this.color});

  final TextEditingController controller;
  final String hintText;
  final IconData iconData;
  bool isObscure;
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
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        obscureText: isObscure,
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
