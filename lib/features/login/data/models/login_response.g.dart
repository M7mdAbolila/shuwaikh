// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      token: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      userData: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'token_type': instance.tokenType,
      'user': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      lname: json['lname'] as String?,
      fname: json['fname'] as String?,
      address: json['address'] as String?,
      billingFname: json['billing_fname'] as String?,
      billingLname: json['billing_lname'] as String?,
      billingUsername: json['billing_username'] as String?,
      billingNumber: json['billing_number'] as String?,
      billingCity: json['billing_city'] as String?,
      billingAddress: json['billing_address'] as String?,
      shppingFname: json['shpping_fname'] as String?,
      shppingLname: json['shpping_lname'] as String?,
      shppingUsername: json['shpping_username'] as String?,
      shppingEmail: json['shpping_email'] as String?,
      shppingNumber: json['shpping_number'] as String?,
      shppingCity: json['shpping_city'] as String?,
      shppingAddress: json['shpping_address'] as String?,
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      number: json['number'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'lname': instance.lname,
      'fname': instance.fname,
      'email': instance.email,
      'number': instance.number,
      'photo': instance.photo,
      'address': instance.address,
      'billing_fname': instance.billingFname,
      'billing_lname': instance.billingLname,
      'billing_username': instance.billingUsername,
      'billing_number': instance.billingNumber,
      'billing_city': instance.billingCity,
      'billing_address': instance.billingAddress,
      'shpping_fname': instance.shppingFname,
      'shpping_lname': instance.shppingLname,
      'shpping_username': instance.shppingUsername,
      'shpping_email': instance.shppingEmail,
      'shpping_number': instance.shppingNumber,
      'shpping_city': instance.shppingCity,
      'shpping_address': instance.shppingAddress,
    };
