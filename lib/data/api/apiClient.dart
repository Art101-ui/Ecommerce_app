import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/utilis/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(APPCONSTANTS.token)!;
    _mainHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 404, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    debugPrint(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
