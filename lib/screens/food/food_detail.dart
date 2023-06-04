import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/models/product_models.dart';
import 'package:todo_app/screens/cart/cart_page.dart';
import 'package:todo_app/screens/home/main_car_page.dart';
import 'package:todo_app/screens/routes/routes_help.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/constants.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_column.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/expanded_text_widget.dart';

class FoodDetail extends StatelessWidget {
  FoodDetail({required this.pageId, required this.cartPageId, Key? key})
      : super(key: key);
  String cartPageId;
  int pageId;
  @override
  Widget build(BuildContext context) {
    var _ = Get.find<ProductControllers>();

    ProductsModel product = _.repoList[pageId];
    _.initProduct(product, Get.find<CartControllers>());

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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${APPCONSTANTS.baseUrl}${APPCONSTANTS.uploads}${product.img!}'))),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (cartPageId == 'cartPage') {
                        Get.toNamed(RoutesHelper.getCartPage());
                      } else {
                        Get.toNamed(RoutesHelper.getinitial());
                      }
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_new_sharp,
                      iconcolor: AppColors.mainBlackColor,
                    ),
                  ),
                  GetBuilder<ProductControllers>(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.getCartPage());
                      },
                      child: Stack(children: [
                        AppIcon(
                            icon: Icons.shopping_cart_outlined,
                            iconcolor: AppColors.mainBlackColor),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: _.totalItems() >= 1
                                ? AppIcon(
                                    size: 20,
                                    icon: Icons.circle,
                                    iconcolor: AppColors.mainColor)
                                : Container()),
                        Positioned(
                            right: 4,
                            top: 2,
                            child: _.totalItems() >= 1
                                ? BigText(
                                    text: _.totalItems().toString(),
                                    color: Colors.white,
                                    size: 12,
                                  )
                                : Container()),
                      ]),
                    );
                  })
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
                    AppColumn(
                      text: product.name!,
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandedTextWidget(text: product.description!),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar:
          GetBuilder<ProductControllers>(builder: (productController) {
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
                      GestureDetector(
                        onTap: () {
                          productController.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor1,
                        ),
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: productController.CartQuantity.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                      GestureDetector(
                          onTap: () {
                            productController.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor2))
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  productController.addItems(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.width20,
                      left: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text: '\$${product.price} | Add to cart',
                    color: AppColors.buttonBackgroundColor,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
