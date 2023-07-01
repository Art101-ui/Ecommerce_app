import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/data/api/apiClient.dart';
import 'package:todo_app/models/signup_model.dart';
import 'package:todo_app/utilis/constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<String> getToken() async {
    return await sharedPreferences.getString(APPCONSTANTS.token) ?? "None";
  }

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClient.postData(
        APPCONSTANTS.registerUri, signUpModel.toJson());
  }

  Future<Response> login(String email, String password) async {
    return await apiClient
        .postData(APPCONSTANTS.login, {"email": email, "password": password});
  }

  bool isuserLoggedIn() {
    return sharedPreferences.containsKey(APPCONSTANTS.token);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(APPCONSTANTS.token, token);
  }

  void saveUserLogindetails(String email, String password) async {
    try {
      await sharedPreferences.setString(APPCONSTANTS.email, email);
      await sharedPreferences.setString(APPCONSTANTS.password, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearData() {
    sharedPreferences.remove(APPCONSTANTS.token);
    sharedPreferences.remove(APPCONSTANTS.email);
    sharedPreferences.remove(APPCONSTANTS.password);

    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
