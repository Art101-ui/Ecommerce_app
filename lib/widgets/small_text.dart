// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color color;
  double size;
  double height;

  final String text;

  SmallText({
    Key? key,
    this.color = const Color(0xFFABA6BF),
    this.size = 12,
    this.height = 1.4,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: size,
        fontFamily: 'Lato',
      ),
    );
  }
}
