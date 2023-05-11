import 'package:get/get.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/utilis/constants.dart';

class RecommendedRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedRepo({required this.apiClient});

  Future<Response> getRepoList() async {
    return await apiClient.getData(APPCONSTANTS.recommendedUri);
  }
}
