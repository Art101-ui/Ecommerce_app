import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/models/signup_model.dart';
import 'package:todo_app/utilis/constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClient.postData(
        APPCONSTANTS.registerUri, signUpModel.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(APPCONSTANTS.token, token);
  }
}
