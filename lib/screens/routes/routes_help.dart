import 'package:get/get.dart';
import 'package:todo_app/screens/cart/cart_page.dart';
import 'package:todo_app/screens/food/food_detail.dart';
import 'package:todo_app/screens/food/recommended_food_detail.dart';
import 'package:todo_app/screens/home/main_car_page.dart';

class RoutesHelper {
  static const String initial = '/';
  static const String foodDetail = '/foodDetail';
  static const String recommendedFood = '/recommended_foodDetail';
  static const String cartPage = '/cartPage';

  static String getinitial() => initial;
  static String getCartPage() => cartPage;
  static String getfoodDetail(int foodId, String cartPage) =>
      '$foodDetail?foodId=$foodId&cartPage=$cartPage';
  static String getRecommendedFood(
          int recommendedProductId, String cartPageId) =>
      '$recommendedFood?recommendedProductId=$recommendedProductId&cartPageId=$cartPageId';

  static List<GetPage> getPage = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: foodDetail,
        page: () {
          var foodId = Get.parameters['foodId'];
          var cartPageId = Get.parameters['cartPage'];
          return FoodDetail(
              pageId: int.parse(foodId!), cartPageId: cartPageId!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var recommendedProductId = Get.parameters['recommendedProductId'];
          var cartPage = Get.parameters['cartPageId'];
          return RecommendedFoodDetail(
              recommendedProductId: int.parse(recommendedProductId!),
              cartPageId: cartPage!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
