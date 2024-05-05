import 'package:shared_preferences/shared_preferences.dart';

class UserInfoCachceHelper {
  static Future<void> cacheUserInfo({
    String? token,
    String? username,
    String? email,
    String? number,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token ?? '');
    sharedPreferences.setString("username", username ?? '');
    sharedPreferences.setString("email", email ?? '');
    sharedPreferences.setString("number", number ?? '');
  }

  static Future<String?> getCachedToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    return token;
  }


  static Future<Map> getCachedUserInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userInfo = {
      'token': sharedPreferences.getString('token'),
      'username': sharedPreferences.getString('username'),
      'email': sharedPreferences.getString('email'),
      'number': sharedPreferences.getString('number'),
    };
    return userInfo;
  }
}
