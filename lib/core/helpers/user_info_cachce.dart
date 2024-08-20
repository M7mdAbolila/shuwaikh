// ignore_for_file: use_build_context_synchronously

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

saveShippingAndBillingDetails(BuildContext context) async {
  if (context.read<PlaceOrderCubit>().sameAsShipping == 1) {
    await UserInfoCachceHelper.cacheUserShippingInfo(
      shAddress: context.read<PlaceOrderCubit>().shippingAddress.text,
      shCity: context.read<PlaceOrderCubit>().shippingCity.text,
      shEmail: context.read<PlaceOrderCubit>().shippingEmail.text,
      shFname: context.read<PlaceOrderCubit>().shippingFname.text,
      shLname: context.read<PlaceOrderCubit>().shippingLname.text,
      shNumber: context.read<PlaceOrderCubit>().shippingNumber.text,
    );
    await UserInfoCachceHelper.cacheUserBillingInfo(
      billAddress: context.read<PlaceOrderCubit>().shippingAddress.text,
      billCity: context.read<PlaceOrderCubit>().shippingCity.text,
      billEmail: context.read<PlaceOrderCubit>().shippingEmail.text,
      billFname: context.read<PlaceOrderCubit>().shippingFname.text,
      billLname: context.read<PlaceOrderCubit>().shippingLname.text,
      billNumber: context.read<PlaceOrderCubit>().shippingNumber.text,
    );
    context.read<PlaceOrderCubit>().placeOrder();
  } else {
    await UserInfoCachceHelper.cacheUserShippingInfo(
      shAddress: context.read<PlaceOrderCubit>().shippingAddress.text,
      shCity: context.read<PlaceOrderCubit>().shippingCity.text,
      shEmail: context.read<PlaceOrderCubit>().shippingEmail.text,
      shFname: context.read<PlaceOrderCubit>().shippingFname.text,
      shLname: context.read<PlaceOrderCubit>().shippingLname.text,
      shNumber: context.read<PlaceOrderCubit>().shippingNumber.text,
    );
    await UserInfoCachceHelper.cacheUserBillingInfo(
      billAddress: context.read<PlaceOrderCubit>().billingAddress.text,
      billCity: context.read<PlaceOrderCubit>().billingCity.text,
      billEmail: context.read<PlaceOrderCubit>().billingEmail.text,
      billFname: context.read<PlaceOrderCubit>().billingFname.text,
      billLname: context.read<PlaceOrderCubit>().billingLname.text,
      billNumber: context.read<PlaceOrderCubit>().billingNumber.text,
    );
    context.read<PlaceOrderCubit>().placeOrder();
  }
}

getSavedDataToPalaceOrderCubit(BuildContext context) async {
  final UserData userShippingData =
      await UserInfoCachceHelper.getCachedUserShippingInfo();
  final UserData userBillingData =
      await UserInfoCachceHelper.getCachedUserBillingInfo();
  // = = = = = billing details = = = =
  context.read<PlaceOrderCubit>().billingAddress.text =
      userBillingData.billingAddress!;
  context.read<PlaceOrderCubit>().billingCity.text =
      userBillingData.billingCity!;
  context.read<PlaceOrderCubit>().billingEmail.text =
      userBillingData.billingEmail!;
  context.read<PlaceOrderCubit>().billingFname.text =
      userBillingData.billingFname!;
  context.read<PlaceOrderCubit>().billingLname.text =
      userBillingData.billingLname!;
  context.read<PlaceOrderCubit>().billingNumber.text =
      userBillingData.billingNumber!;
  // = = = =  shipping details = = = = = =
  context.read<PlaceOrderCubit>().shippingAddress.text =
      userShippingData.shippingAddress!;
  context.read<PlaceOrderCubit>().shippingCity.text =
      userShippingData.shippingCity!;
  context.read<PlaceOrderCubit>().shippingEmail.text =
      userShippingData.shippingEmail!;
  context.read<PlaceOrderCubit>().shippingFname.text =
      userShippingData.shippingFname!;
  context.read<PlaceOrderCubit>().shippingLname.text =
      userShippingData.shippingLname!;
  context.read<PlaceOrderCubit>().shippingNumber.text =
      userShippingData.shippingNumber!;
}
