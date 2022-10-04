import 'package:flutter/material.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/icon-text.dart';
import 'package:todo_app/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: Dimensions.font15,
                      )),
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.height15,
            ),
            SmallText(text: '500 comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget(
                icon: Icons.airline_seat_recline_normal_rounded,
                iconColor: AppColors.iconColor1,
                text: '5'),
            IconTextWidget(
                icon: Icons.bolt,
                iconColor: AppColors.mainColor,
                text: '52 hp'),
            IconTextWidget(
                icon: Icons.speed,
                iconColor: AppColors.iconColor2,
                text: '72km/h'),
          ],
        )
      ],
    );
  }
}
