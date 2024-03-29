// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:todo_app/utilis/dimensions.dart';

class BigText extends StatelessWidget {
  final Color color;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;
  final String text;
  BigText({
    Key? key,
    this.color = const Color(0xFF000000),
    this.size = 0,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
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
        fontWeight: fontWeight,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontFamily: 'Lato',
      ),
    );
  }
}
