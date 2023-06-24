import 'package:get/get.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/utilis/constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getRepoList() async {
    return await apiClient.getData(APPCONSTANTS.productUri);
  }
}
