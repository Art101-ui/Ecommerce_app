import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/base/no_data_page.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/models/cart_models.dart';
import 'package:todo_app/screens/routes/routes_help.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/constants.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';
import 'package:todo_app/widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  CartHistory({super.key});
  List<CartModel> getCartHistory =
      Get.find<CartControllers>().getToCartHistory().reversed.toList();

  @override
  Widget build(BuildContext context) {
    Map<String, int> cartItemsByOrder = {};

    for (int i = 0; i < getCartHistory.length; i++) {
      if (cartItemsByOrder.containsKey(getCartHistory[i].time)) {
        cartItemsByOrder.update(getCartHistory[i].time!, (value) => ++value);
      } else {
        cartItemsByOrder.putIfAbsent(getCartHistory[i].time!, () => 1);
      }
    }

    List<int> cartItemsByOrderList() {
      return cartItemsByOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartTimeByOrderList() {
      return cartItemsByOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsByOrder = cartItemsByOrderList();

    int listCount = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistory.length) {
        var inputFormat = DateFormat('yyyy-MM-dd  HH:mm:ss');
        var inputDate =
            DateTime.parse(getCartHistory[listCount].time.toString());
        var outputFormat = DateFormat('MM/dd/yyyy  hh:mm a');
        var outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
        body: Column(children: [
      Container(
        height: Dimensions.height10 * 10,
        width: double.maxFinite,
        color: AppColors.buttonBackgroundColor,
        padding: EdgeInsets.only(
            top: Dimensions.height10 * 4,
            left: Dimensions.height20,
            right: Dimensions.height20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BigText(
              text: "Cart History",
              color: AppColors.mainColor,
              size: 25,
            ),
            Icon(
              Icons.shopping_cart_checkout_outlined,
              size: 25,
              color: AppColors.mainColor,
            )
          ],
        ),
      ),
      GetBuilder<CartControllers>(builder: (cartControllers) {
        return cartControllers.getToCartHistory().isNotEmpty
            ? Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10 * 2,
                      left: Dimensions.height20,
                      right: Dimensions.height20),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      children: [
                        for (int i = 0; i < itemsByOrder.length; i++)
                          Container(
                            height: Dimensions.height10 * 13,
                            padding:
                                EdgeInsets.only(bottom: Dimensions.height20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                timeWidget(listCount),
                                SizedBox(
                                  height: Dimensions.height10 / 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      children: List.generate(itemsByOrder[i],
                                          (index) {
                                        if (listCount < getCartHistory.length) {
                                          listCount++;
                                        }
                                        return index <= 2
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    right: Dimensions.width10 /
                                                        4),
                                                height: Dimensions.height20 * 4,
                                                width: Dimensions.width20 * 4,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            APPCONSTANTS
                                                                    .baseUrl +
                                                                APPCONSTANTS
                                                                    .uploads +
                                                                getCartHistory[
                                                                        listCount -
                                                                            1]
                                                                    .img
                                                                    .toString()))))
                                            : Container();
                                      }),
                                    ),
                                    Container(
                                      height: Dimensions.height20 * 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SmallText(text: 'Total'),
                                          BigText(
                                              text: itemsByOrder[i] == 1
                                                  ? '${itemsByOrder[i]} item'
                                                  : '${itemsByOrder[i]} items'),
                                          GestureDetector(
                                            onTap: () {
                                              var orderTime =
                                                  cartTimeByOrderList();
                                              Map<int, CartModel> recallOrder =
                                                  {};
                                              for (var j = 0;
                                                  j < getCartHistory.length;
                                                  j++) {
                                                if (orderTime[i] ==
                                                    getCartHistory[j].time) {
                                                  recallOrder.putIfAbsent(
                                                      getCartHistory[j].id!,
                                                      () {
                                                    return getCartHistory[j];
                                                  });
                                                  // print(CartModel.fromJson(jsonDecode(
                                                  //     jsonEncode(getCartHistory[i]))));
                                                  Get.find<CartControllers>()
                                                      .orderTime = recallOrder;
                                                  Get.find<CartControllers>()
                                                      .addCartToList();

                                                  Get.toNamed(RoutesHelper
                                                      .getCartPage());
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10,
                                                  vertical:
                                                      Dimensions.height10 / 2),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          AppColors.mainColor),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: SmallText(
                                                text: 'Add to cart',
                                                color: AppColors.mainColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: const NoDataPage(
                      icon: Icons.shopping_cart_checkout_rounded,
                      text: 'Nothing bought yet'),
                ),
              );
      })
    ]));
  }
}
