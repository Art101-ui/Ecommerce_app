import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/cart_models.dart';
import 'package:todo_app/utilis/constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> _cart = [];
  List<String> _cartHistory = [];

  void addCartToList(List<CartModel> cartList) {
    // sharedPreferences.remove(APPCONSTANTS.CartList);
    // sharedPreferences.remove(APPCONSTANTS.CartHistoryList);
    var time = DateTime.now().toString();
    _cart = [];

    cartList.forEach((element) {
      element.time = time;
      _cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(APPCONSTANTS.CartList, _cart);
  }

  List<CartModel> getCartList() {
    List<String> cartString = [];

    if (sharedPreferences.containsKey(APPCONSTANTS.CartList)) {
      cartString = sharedPreferences.getStringList(APPCONSTANTS.CartList)!;
      print("inside cart is " + cartString.toString());
    }

    List<CartModel> cartModel = [];

    cartString.forEach(
        (element) => cartModel.add(CartModel.fromJson(jsonDecode(element))));

    return cartModel;
  }

  void addToCartHistory() {
    _cart.forEach((element) {
      _cartHistory.add(element);
    });
    removeCart();
    print('history' + _cartHistory.length.toString());
    sharedPreferences.setStringList(APPCONSTANTS.CartHistoryList, _cartHistory);

    for (var i = 0; i < getCartHistoryList().length; i++) {
      print("Time of order is " + getCartHistoryList()[i].time.toString());
    }
    print(getCartHistoryList());
  }

  void removeCart() {
    _cart = [];
    sharedPreferences.remove(APPCONSTANTS.CartList);
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(APPCONSTANTS.CartHistoryList)) {
      _cartHistory = [];
      _cartHistory =
          sharedPreferences.getStringList(APPCONSTANTS.CartHistoryList)!;
      print("Cart List length is " + _cartHistory.length.toString());
    }
    List<CartModel> cartHistoryList = [];

    _cartHistory.forEach((element) =>
        cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));

    return cartHistoryList;
  }
}
