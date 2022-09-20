// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const IconTextWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 15,
        ),
        SizedBox(
          width: 4,
        ),
        SmallText(text: text)
      ],
    );
  }
}
