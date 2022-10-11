import 'package:flutter/material.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/expanded_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 78,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear, iconcolor: AppColors.mainBlackColor),
                AppIcon(
                    icon: Icons.shopping_cart_checkout_outlined,
                    iconcolor: AppColors.mainBlackColor)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(25),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10, bottom: Dimensions.height10),
                  decoration: BoxDecoration(
                      color: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                  child: Center(
                    child: BigText(
                      text: 'Kia EV6',
                      size: Dimensions.font26,
                    ),
                  ),
                )),
            backgroundColor: AppColors.mainColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/hyundai.jpg',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width15,
                  right: Dimensions.width20,
                  top: Dimensions.height15),
              child: ExpandedTextWidget(
                  text:
                      '''Launched in 2021, the Kia EV6 is the Korean brand’s first production car that has been specifically designed as an all-electric model and is closely related to the Ioniq 5 from sister brand Hyundai. 

The EV6 debuts new and very bold styling, and comes in single-motor two-wheel-drive form or with dual-motor four-wheel-drive. Buyers are able to choose it on the emphasis on range, which depending on model stretches up to a battery range of 316 miles between charges, or performance, the flagship GT version boasting a sub four-second 0-62mph time. 

Like the Polestar 2 and Hyundai Ioniq 5, the Kia EV6 sits slightly higher than a regular perol-engined car but lower than an SUV.

Reviews of the EV6 have been universally positive, the car earning very high praise. Auto Express describes it as “a little sportier and more dynamic” than its Ioniq sister; “the styling sets the tone with a swoopier, curvier look to its profile.”

The Sun, however, argues that the EV6 is a “little more normal” than the Ioniq but adds “it does north of 300 miles between charges, drives well and has all the toys and luxury you would expect from a car at that price.”

For quite a large electric car, the EV6 is also quite sporty; “It really is excellent at dealing with those junction pull-aways and gap-threading,” says Top Gear, adding “it’s also quiet, calm and relaxing.”    

The electric-specific platform liberates more interior space but reviewers also like the design inside, especially the curved instrument panel. “It looks very smart, with as many interesting touches as the exterior,” says Carbuyer.'''),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: AppColors.buttonBackgroundColor, width: 1))),
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                      icon: Icons.remove,
                      iconSize: Dimensions.icon24,
                      iconcolor: AppColors.buttonBackgroundColor,
                      backgroundColor: AppColors.mainColor),
                  BigText(
                    text: '\$12.88  ' + '*' + '  0',
                    color: AppColors.mainBlackColor,
                  ),
                  AppIcon(
                      icon: Icons.add,
                      iconSize: Dimensions.icon24,
                      iconcolor: AppColors.buttonBackgroundColor,
                      backgroundColor: AppColors.mainColor)
                ]),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
          )
        ],
      ),
    );
  }
}
