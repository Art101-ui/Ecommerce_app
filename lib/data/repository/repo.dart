import 'package:get/get.dart';
import 'package:todo_app/data/api/apiClient.dart';

class Repo extends GetxService {
  final ApiClient apiClient;

  Repo({required this.apiClient});

  Future<Response> getRepoList() async {
    return await apiClient.getData('uri');
  }
}
