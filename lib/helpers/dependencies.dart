import 'package:get/get.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/data/controllers/recommendedControllers.dart';
import 'package:todo_app/data/repository/popularRepo.dart';
import 'package:todo_app/data/repository/recommendedRepo.dart';
import 'package:todo_app/utilis/constants.dart';

Future<void> init() async {
  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: APPCONSTANTS.baseUrl));

  // Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => ProductControllers(repo: Get.find()));
  Get.lazyPut(() => RecommendedControllers(repo: Get.find()));
}
