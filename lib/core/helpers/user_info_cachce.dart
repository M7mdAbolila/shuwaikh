// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/core/helpers/shared_pref_helper.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';

import '../../features/checkout/logic/place_order_cubit/place_order_cubit.dart';
import 'constants.dart';

class UserInfoCachceHelper {
  static Future<void> cacheUserInfo({
    String? username,
    String? email,
    String? fname,
    String? lname,
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
    sharedPreferences.setString("username", username ?? '');
    sharedPreferences.setString("email", email ?? '');
    sharedPreferences.setString("photo", photo ?? '');
    sharedPreferences.setString("fname", fname ?? '');
    sharedPreferences.setString("lname", lname ?? '');
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
    final String? userToken =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    return userToken;
  }

  static Future<UserData> getCachedUserInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userInfo = UserData(
      username: sharedPreferences.getString(SharedPrefKeys.username),
      email: sharedPreferences.getString(SharedPrefKeys.email),
      fname: sharedPreferences.getString(SharedPrefKeys.fname),
      lname: sharedPreferences.getString(SharedPrefKeys.lname),
      number: sharedPreferences.getString(SharedPrefKeys.number),
      photo: sharedPreferences.getString(SharedPrefKeys.photo),
      shippingFname: sharedPreferences.getString(SharedPrefKeys.shFname),
      shippingLname: sharedPreferences.getString(SharedPrefKeys.shLname),
      shippingAddress: sharedPreferences.getString(SharedPrefKeys.shAddress),
      shippingEmail: sharedPreferences.getString(SharedPrefKeys.shEmail),
      shippingNumber: sharedPreferences.getString(SharedPrefKeys.shNumber),
      shippingCity: sharedPreferences.getString(SharedPrefKeys.shCity),
      billingFname: sharedPreferences.getString(SharedPrefKeys.billFname),
      billingLname: sharedPreferences.getString(SharedPrefKeys.billLname),
      billingAddress: sharedPreferences.getString(SharedPrefKeys.billAddress),
      billingEmail: sharedPreferences.getString(SharedPrefKeys.billEmail),
      billingNumber: sharedPreferences.getString(SharedPrefKeys.billNumber),
      billingCity: sharedPreferences.getString(SharedPrefKeys.billCity),
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
      shippingFname: sharedPreferences.getString(SharedPrefKeys.shFname),
      shippingLname: sharedPreferences.getString(SharedPrefKeys.shLname),
      shippingAddress: sharedPreferences.getString(SharedPrefKeys.shAddress),
      shippingEmail: sharedPreferences.getString(SharedPrefKeys.shEmail),
      shippingNumber: sharedPreferences.getString(SharedPrefKeys.shNumber),
      shippingCity: sharedPreferences.getString(SharedPrefKeys.shCity),
    );

    return userShippingInfo;
  }

  static Future<UserData> getCachedUserBillingInfo() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userBillingInfo = UserData(
      billingFname: sharedPreferences.getString(SharedPrefKeys.billFname),
      billingLname: sharedPreferences.getString(SharedPrefKeys.billLname),
      billingAddress: sharedPreferences.getString(SharedPrefKeys.billAddress),
      billingEmail: sharedPreferences.getString(SharedPrefKeys.billEmail),
      billingNumber: sharedPreferences.getString(SharedPrefKeys.billNumber),
      billingCity: sharedPreferences.getString(SharedPrefKeys.billCity),
    );
    return userBillingInfo;
  }
}

Future<void> saveShippingAndBillingDetails(BuildContext context) async {
  var userDetails = context.read<PlaceOrderCubit>();
  if (userDetails.sameAsShipping == 1) {
    log('SaveDetails ${userDetails.shippingAddress.text} = = = = ');
    await UserInfoCachceHelper.cacheUserShippingInfo(
      shAddress: userDetails.shippingAddress.text,
      shCity: userDetails.shippingCity.text,
      shEmail: userDetails.shippingEmail.text,
      shFname: userDetails.shippingFname.text,
      shLname: userDetails.shippingLname.text,
      shNumber: userDetails.shippingNumber.text,
    );
    await UserInfoCachceHelper.cacheUserBillingInfo(
      billAddress: userDetails.shippingAddress.text,
      billCity: userDetails.shippingCity.text,
      billEmail: userDetails.shippingEmail.text,
      billFname: userDetails.shippingFname.text,
      billLname: userDetails.shippingLname.text,
      billNumber: userDetails.shippingNumber.text,
    );
    userDetails.placeOrder();
  } else {
    await UserInfoCachceHelper.cacheUserShippingInfo(
      shAddress: userDetails.shippingAddress.text,
      shCity: userDetails.shippingCity.text,
      shEmail: userDetails.shippingEmail.text,
      shFname: userDetails.shippingFname.text,
      shLname: userDetails.shippingLname.text,
      shNumber: userDetails.shippingNumber.text,
    );
    await UserInfoCachceHelper.cacheUserBillingInfo(
      billAddress: userDetails.billingAddress.text,
      billCity: userDetails.billingCity.text,
      billEmail: userDetails.billingEmail.text,
      billFname: userDetails.billingFname.text,
      billLname: userDetails.billingLname.text,
      billNumber: userDetails.billingNumber.text,
    );
    userDetails.placeOrder();
  }
}

Future<void> getSavedDataToPalaceOrderCubit(BuildContext context) async {
  var userDetails = context.read<PlaceOrderCubit>();
  final UserData userShippingData =
      await UserInfoCachceHelper.getCachedUserShippingInfo();
  final UserData userBillingData =
      await UserInfoCachceHelper.getCachedUserBillingInfo();
  // = = = = = billing details = = = =
  userDetails.billingAddress.text = userBillingData.billingAddress!;
  userDetails.billingCity.text = userBillingData.billingCity!;
  userDetails.billingEmail.text = userBillingData.billingEmail!;
  userDetails.billingFname.text = userBillingData.billingFname!;
  userDetails.billingLname.text = userBillingData.billingLname!;
  userDetails.billingNumber.text = userBillingData.billingNumber!;
  log('getSaveDetails  ${userDetails.billingAddress.text} = = =  =');
  // = = = =  shipping details = = = = = =
  userDetails.shippingAddress.text = userShippingData.shippingAddress!;
  userDetails.shippingCity.text = userShippingData.shippingCity!;
  userDetails.shippingEmail.text = userShippingData.shippingEmail!;
  userDetails.shippingFname.text = userShippingData.shippingFname!;
  userDetails.shippingLname.text = userShippingData.shippingLname!;
  userDetails.shippingNumber.text = userShippingData.shippingNumber!;
}
