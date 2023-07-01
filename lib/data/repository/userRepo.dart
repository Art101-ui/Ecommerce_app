import 'package:get/get.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/utilis/constants.dart';

class UserRepo extends GetxService {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

 Future<Response> getProfile() async{
    return await apiClient.getData(APPCONSTANTS.getProfile);
  }
}
