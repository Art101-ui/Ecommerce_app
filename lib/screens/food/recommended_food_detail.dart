import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/data/controllers/recommendedControllers.dart';
import 'package:todo_app/models/product_models.dart';
import 'package:todo_app/screens/cart/cart_page.dart';
import 'package:todo_app/screens/routes/routes_help.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/constants.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/expanded_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  RecommendedFoodDetail({required this.recommendedProductId, required this.cartPageId, Key? key})
      : super(key: key);

  String cartPageId;
  int recommendedProductId;
  @override
  Widget build(BuildContext context) {
    RecommendedControllers _ = Get.find<RecommendedControllers>();
    ProductsModel recoProducts = _.recommendedList[recommendedProductId];

    var product = Get.find<ProductControllers>();
    product.initProduct(recoProducts, Get.find<CartControllers>());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
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
                        icon: Icons.clear,
                        iconcolor: AppColors.mainBlackColor)),
                GetBuilder<ProductControllers>(builder: (product) {
                  return Stack(children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.getCartPage());
                      },
                      child: AppIcon(
                          icon: Icons.shopping_cart_outlined,
                          iconcolor: AppColors.mainBlackColor),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: product.totalItems() >= 1
                            ? AppIcon(
                                size: 20,
                                icon: Icons.circle,
                                iconcolor: AppColors.mainColor)
                            : Container()),
                    Positioned(
                        right: 4,
                        top: 3,
                        child: product.totalItems() >= 1
                            ? BigText(
                                text: product.totalItems().toString(),
                                color: Colors.white,
                                size: 12,
                              )
                            : Container()),
                  ]);
                })
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
                      text: recoProducts.name!,
                      size: Dimensions.font26,
                    ),
                  ),
                )),
            backgroundColor: AppColors.mainColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${APPCONSTANTS.baseUrl}${APPCONSTANTS.uploads}${recoProducts.img!}',
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
              child: ExpandedTextWidget(text: recoProducts.description!),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<ProductControllers>(builder: (productController) {
        return Column(
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
                    GestureDetector(
                      onTap: () {
                        productController.setQuantity(false);
                      },
                      child: AppIcon(
                          icon: Icons.remove,
                          iconSize: Dimensions.icon24,
                          iconcolor: AppColors.buttonBackgroundColor,
                          backgroundColor: AppColors.mainColor),
                    ),
                    BigText(
                      text: '\$${recoProducts.price}  ' +
                          'x ' +
                          productController.CartQuantity.toString(),
                      color: AppColors.mainBlackColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        productController.setQuantity(true);
                      },
                      child: AppIcon(
                          icon: Icons.add,
                          iconSize: Dimensions.icon24,
                          iconcolor: AppColors.buttonBackgroundColor,
                          backgroundColor: AppColors.mainColor),
                    )
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      product.addItems(recoProducts);
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
                        text: '\$${recoProducts.price} | Add to cart',
                        color: AppColors.buttonBackgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
