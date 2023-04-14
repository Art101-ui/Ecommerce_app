import 'package:get/get.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/data/controllers/controllers.dart';
import 'package:todo_app/data/repository/repo.dart';

Future<void> init() async {
  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: Get.find()));

  // Repo
  Get.lazyPut(() => Repo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => Controllers(repo: Get.find()));
}
