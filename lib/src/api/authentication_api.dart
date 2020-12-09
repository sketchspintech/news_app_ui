import 'dart:convert';

import 'package:laravel_news_app/src/api/api_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationApi {
  Future<bool> login(Map<String, dynamic> data) async {
    var response = await ApiUtil().authentication('/login', data);
    if (response.statusCode == 200) {
      try {
        var body = jsonDecode(response.body);
        var data = body['data'];
        var token = data['token'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', token);
        return true;
      } catch (Exception) {
        return false;
      }
    }
    return false;
  }
}
