// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/utilis/dimensions.dart';

class AppIcon extends StatelessWidget {
  final Color iconcolor;
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final double iconSize;

  const AppIcon({
    Key? key,
    this.iconcolor = const Color(0xff756d54),
    required this.icon,
    this.size = 40,
    this.iconSize = 16,
    this.backgroundColor = const Color(0xffd9d8ee),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconSize,
      ),
    );
  }
}
