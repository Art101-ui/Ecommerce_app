import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todo_app/base/no_data_page.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/data/controllers/recommendedControllers.dart';
import 'package:todo_app/screens/home/main_car_page.dart';
import 'package:todo_app/screens/routes/routes_help.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/constants.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_new_sharp,
                      iconcolor: AppColors.mainBlackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesHelper.getinitial());
                    },
                    child: AppIcon(
                        icon: Icons.home, iconcolor: AppColors.mainBlackColor),
                  ),
                  GetBuilder<CartControllers>(builder: (_) {
                    return Stack(children: [
                      AppIcon(
                          icon: Icons.shopping_cart_outlined,
                          iconcolor: AppColors.mainBlackColor),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: _.totalItems >= 1
                              ? AppIcon(
                                  size: 20,
                                  icon: Icons.circle,
                                  iconcolor: AppColors.mainColor)
                              : Container()),
                      Positioned(
                          right: 4,
                          top: 2,
                          child: _.totalItems >= 1
                              ? BigText(
                                  text: _.totalItems.toString(),
                                  color: Colors.white,
                                  size: 12,
                                )
                              : Container()),
                    ]);
                  })
                ],
              )),
          Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: GetBuilder<CartControllers>(builder: (cartController) {
                var cart = cartController.getItems;
                return cart.isEmpty
                    ? NoDataPage(
                        icon: Icons.shopping_cart_checkout_outlined,
                        text: 'Cart is Empty')
                    : ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: Dimensions.height10 / 2),
                            height: Dimensions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var productsId =
                                        Get.find<ProductControllers>()
                                            .repoList
                                            .indexOf(cart[i].product);

                                    if (productsId >= 0) {
                                      Get.toNamed(RoutesHelper.getfoodDetail(
                                          productsId, 'cartPage'));
                                    } else {
                                      var recommendedId =
                                          Get.find<RecommendedControllers>()
                                              .recommendedList
                                              .indexOf(cart[i].product);
                                      if (recommendedId < 0) {
                                        Get.snackbar('History product ',
                                            'Product review not available for history product ',
                                            backgroundColor:
                                                AppColors.mainColor,
                                            colorText: Colors.white);
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.width20 * 5,
                                    height: Dimensions.height20 * 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${APPCONSTANTS.baseUrl}${APPCONSTANTS.uploads}${cart[i].img}'))),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text: cart[i].name.toString(),
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: 'Spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                              color: Colors.red,
                                              text: '\$${cart[i].price}'),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10,
                                                  bottom: Dimensions.height10,
                                                  right: Dimensions.width10,
                                                  left: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20)),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItems(
                                                          cart[i].product!, -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor1,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2),
                                                  BigText(
                                                      text:
                                                          '${cart[i].quantity}'
                                                      // productController.CartQuantity.toString()
                                                      ),
                                                  SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItems(
                                                            cart[i].product!,
                                                            1);
                                                      },
                                                      child: Icon(Icons.add,
                                                          color: AppColors
                                                              .signColor2))
                                                ],
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );
                        });
              }))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartControllers>(builder: (cartController) {
        return Container(
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
            child: cartController.getItems.isNotEmpty
                ? Row(
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
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child: Row(
                            children: [
                              SizedBox(width: Dimensions.width10 / 2),
                              BigText(
                                  text: '\$ ${cartController.getTotalAmount}'),
                              SizedBox(width: Dimensions.width10 / 2),
                            ],
                          )),
                      GestureDetector(
                        onTap: () {
                          print('tapped');
                          cartController.addToCartHistoryList();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              right: Dimensions.width20,
                              left: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: AppColors.mainColor),
                          child: BigText(
                            text: '| Checkout',
                            color: AppColors.buttonBackgroundColor,
                          ),
                        ),
                      )
                    ],
                  )
                : Container());
      }),
    );
  }
}
