import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';

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
    String? photo,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token ?? '');
    sharedPreferences.setString("username", username ?? '');
    sharedPreferences.setString("email", email ?? '');
    sharedPreferences.setString("photo", photo ?? '');
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

  static Future<UserData> getCachedUserInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userInfo = UserData(
      username: sharedPreferences.getString(username),
      email: sharedPreferences.getString(email),
      number: sharedPreferences.getString(number),
      photo: sharedPreferences.getString('photo'),
      shippingFname: sharedPreferences.getString(shFname),
      shippingLname: sharedPreferences.getString(shLname),
      shippingAddress: sharedPreferences.getString(shAddress),
      shippingEmail: sharedPreferences.getString(shEmail),
      shippingNumber: sharedPreferences.getString(shNumber),
      shippingCity: sharedPreferences.getString(shCity),
      billingFname: sharedPreferences.getString(billFname),
      billingLname: sharedPreferences.getString(billLname),
      billingAddress: sharedPreferences.getString(billAddress),
      billingEmail: sharedPreferences.getString(billEmail),
      billingNumber: sharedPreferences.getString(billNumber),
      billingCity: sharedPreferences.getString(billCity),
    );
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

  static Future<UserData> getCachedUserShippingInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userShippingInfo = UserData(
      shippingFname: sharedPreferences.getString(shFname),
      shippingLname: sharedPreferences.getString(shLname),
      shippingAddress: sharedPreferences.getString(shAddress),
      shippingEmail: sharedPreferences.getString(shEmail),
      shippingNumber: sharedPreferences.getString(shNumber),
      shippingCity: sharedPreferences.getString(shCity),
    );

    return userShippingInfo;
  }

  static Future<UserData> getCachedUserBillingInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userBillingInfo = UserData(
      billingFname: sharedPreferences.getString(billFname),
      billingLname: sharedPreferences.getString(billLname),
      billingAddress: sharedPreferences.getString(billAddress),
      billingEmail: sharedPreferences.getString(billEmail),
      billingNumber: sharedPreferences.getString(billNumber),
      billingCity: sharedPreferences.getString(billCity),
    );
    return userBillingInfo;
  }
}
