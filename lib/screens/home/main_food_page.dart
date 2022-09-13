import 'package:flutter/material.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
                margin: const EdgeInsets.only(top: 25, bottom: 15),
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(
                            text: 'Nigeria',
                            color: AppColors.mainColor,
                          ),
                          Row(
                            children: [
                              SmallText(
                                  text: 'Ibadan',
                                  color: const Color(0xFF000000)),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.mainColor,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}
