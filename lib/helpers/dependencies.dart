import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/data/controllers/recommendedControllers.dart';
import 'package:todo_app/data/repository/cartRepo.dart';
import 'package:todo_app/data/repository/popularRepo.dart';
import 'package:todo_app/data/repository/recommendedRepo.dart';
import 'package:todo_app/utilis/constants.dart';

Future<void> init() async {
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  Get.lazyPut(() => prefs);

  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: APPCONSTANTS.baseUrl));

  // Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:prefs));

  // Controller
  Get.lazyPut(() => ProductControllers(repo: Get.find()));
  Get.lazyPut(() => RecommendedControllers(repo: Get.find()));
  Get.lazyPut(() => CartControllers(cartRepo: Get.find()));
}
