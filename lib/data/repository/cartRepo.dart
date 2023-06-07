import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/cart_models.dart';
import 'package:todo_app/utilis/constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> _cart = [];

  void addCartToList(List<CartModel> cartList) {
    _cart = [];

    cartList.forEach((element) {
      _cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(APPCONSTANTS.CartList, _cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> cartString = [];

    if (sharedPreferences.containsKey(APPCONSTANTS.CartList)) {
      cartString = sharedPreferences.getStringList(APPCONSTANTS.CartList)!;
      print("inside cart is " + cartString.toString());
    }

    List<CartModel> cartModel = [];

    cartString.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartModel;
  }

  
}
