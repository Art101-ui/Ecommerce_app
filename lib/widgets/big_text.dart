// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final Color color;
  double size;
  TextOverflow overflow;
  final String text;
  BigText({
    Key? key,
    this.color = const Color(0xFF000000),
    this.size = 20,
    this.overflow = TextOverflow.fade,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Lato',
      ),
    );
  }
}
