import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/home/main_car_page.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_column.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/expanded_text_widget.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImage,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/hyundai.jpg'))),
              )),
          Positioned(
              top: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_new_sharp,
                      iconcolor: AppColors.mainBlackColor,
                    ),
                  ),
                  AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconcolor: AppColors.mainBlackColor),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImage - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          Dimensions.radius20,
                        ),
                        topLeft: Radius.circular(Dimensions.radius20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(
                      text: 'Rolls Royce',
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: 'Description',
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandedTextWidget(
                            text:
                                'Alluring features force the eye to linger upon every last detail. Wraith’s undeniable draw owes itself to the meticulous workmanship of Rolls-Royce craftspeople. The Comfort Entry System puts convenience at your fingertips, enabling you to lock and unlock your car simply by touching the door handle. The key also stores individual preferences such as seat adjustments, steering wheel position, and Head-Up Display settings.'),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        height: Dimensions.bottomNavigationHeight,
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor1,
                  ),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: '0'),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(Icons.add, color: AppColors.signColor2)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  right: Dimensions.width20,
                  left: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor),
              child: BigText(
                text: '\$10 | Add to cart',
                color: AppColors.buttonBackgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
