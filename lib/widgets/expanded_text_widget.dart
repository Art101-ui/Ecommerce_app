import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utilis/colors.dart';

import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/small_text.dart';

class ExpandedTextWidget extends StatefulWidget {
  final String text;
  const ExpandedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  late String firsthalf;
  late String secondhalf;

  bool hiddentext = true;
  double textHeight = Dimensions.screenHeight / 5.03;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firsthalf = widget.text.substring(0, textHeight.toInt());
      secondhalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondhalf.isEmpty
        ? SmallText(
            text: firsthalf,
            size: Dimensions.font16,
            height: 1.8,
            color: AppColors.paraColor,
          )
        : Column(
            children: [
              hiddentext
                  ? SmallText(
                      text: firsthalf + '...',
                      size: Dimensions.font16,
                      height: 1.8,
                      color: AppColors.paraColor,
                    )
                  : SmallText(
                      text: firsthalf + secondhalf,
                      size: Dimensions.font16,
                      color: AppColors.paraColor,
                      height: 1.8),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddentext = !hiddentext;
                  });
                },
                child: Row(
                  
                  children: [
                    SmallText(
                      text: hiddentext ? 'Show more' : 'Hide',
                      size: Dimensions.font15,
                      color: AppColors.mainColor,
                    ),
                    Icon(
                      hiddentext ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.mainColor,
                    )
                  ],
                ),
              )
            ],
          );
  }
}
