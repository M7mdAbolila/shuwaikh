import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class UserInfoCachceHelper {
  static Future<void> cacheUserInfo({
    String? token,
    String? username,
    String? email,
    String? number,
    String? shFname,
    String? shLname,
    String? shAddress,
    String? shEmail,
    String? shNumber,
    String? shCity,
    String? billFname,
    String? billLname,
    String? billAddress,
    String? billEmail,
    String? billNumber,
    String? billCity,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token ?? '');
    sharedPreferences.setString("username", username ?? '');
    sharedPreferences.setString("email", email ?? '');
    sharedPreferences.setString("number", number ?? '');
    sharedPreferences.setString("shFname", shFname ?? '');
    sharedPreferences.setString("shLname", shLname ?? '');
    sharedPreferences.setString("shAddress", shAddress ?? '');
    sharedPreferences.setString("shEmail", shEmail ?? '');
    sharedPreferences.setString("shNumber", shNumber ?? '');
    sharedPreferences.setString("shCity", shCity ?? '');
    sharedPreferences.setString("billFname", billFname ?? '');
    sharedPreferences.setString("billLname", billLname ?? '');
    sharedPreferences.setString("billAddress", billAddress ?? '');
    sharedPreferences.setString("billEmail", billEmail ?? '');
    sharedPreferences.setString("billNumber", billNumber ?? '');
    sharedPreferences.setString("billCity", billCity ?? '');
  }

  static Future<String?> getCachedToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    return token;
  }

  static Future<Map> getCachedUserInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userInfo = {
      token: sharedPreferences.getString(token),
      username: sharedPreferences.getString(username),
      email: sharedPreferences.getString(email),
      number: sharedPreferences.getString(number),
      shFname: sharedPreferences.getString(shFname),
      shLname: sharedPreferences.getString(shLname),
      shAddress: sharedPreferences.getString(shAddress),
      shEmail: sharedPreferences.getString(shEmail),
      shNumber: sharedPreferences.getString(shNumber),
      shCity: sharedPreferences.getString(shCity),
      billFname: sharedPreferences.getString(billFname),
      billLname: sharedPreferences.getString(billLname),
      billAddress: sharedPreferences.getString(billAddress),
      billEmail: sharedPreferences.getString(billEmail),
      billNumber: sharedPreferences.getString(billNumber),
      billCity: sharedPreferences.getString(billCity),
    };
    return userInfo;
  }

  static Future<void> cacheUserShippingInfo({
    String? shFname,
    String? shLname,
    String? shAddress,
    String? shEmail,
    String? shNumber,
    String? shCity,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("shFname", shFname ?? '');
    sharedPreferences.setString("shLname", shLname ?? '');
    sharedPreferences.setString("shAddress", shAddress ?? '');
    sharedPreferences.setString("shEmail", shEmail ?? '');
    sharedPreferences.setString("shNumber", shNumber ?? '');
    sharedPreferences.setString("shCity", shCity ?? '');
  }

  static Future<void> cacheUserBillingInfo({
    String? billFname,
    String? billLname,
    String? billAddress,
    String? billEmail,
    String? billNumber,
    String? billCity,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("billFname", billFname ?? '');
    sharedPreferences.setString("billLname", billLname ?? '');
    sharedPreferences.setString("billAddress", billAddress ?? '');
    sharedPreferences.setString("billEmail", billEmail ?? '');
    sharedPreferences.setString("billNumber", billNumber ?? '');
    sharedPreferences.setString("billCity", billCity ?? '');
  }

  static Future<Map> getCachedUserShippingInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userShippingInfo = {
      shFname: sharedPreferences.getString(shFname),
      shLname: sharedPreferences.getString(shLname),
      shAddress: sharedPreferences.getString(shAddress),
      shEmail: sharedPreferences.getString(shEmail),
      shNumber: sharedPreferences.getString(shNumber),
      shCity: sharedPreferences.getString(shCity),
    };
    return userShippingInfo;
  }

  static Future<Map> getCachedUserBillingInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userBillingInfo = {
      billFname: sharedPreferences.getString(billFname),
      billLname: sharedPreferences.getString(billLname),
      billAddress: sharedPreferences.getString(billAddress),
      billEmail: sharedPreferences.getString(billEmail),
      billNumber: sharedPreferences.getString(billNumber),
      billCity: sharedPreferences.getString(billCity),
    };
    return userBillingInfo;
  }
}
