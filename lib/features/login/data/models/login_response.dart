import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  final String? token;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'user')
  final UserData? userData;

  LoginResponse({this.token, this.tokenType, this.userData});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final int? id;
  final String? username;
  final String? lname;
  final String? fname;
  final String? email;
  final String? number;
  final String? photo;
  final String? address;
  @JsonKey(name: 'billing_fname')
  final String? billingFname;
  @JsonKey(name: 'billing_lname')
  final String? billingLname;
  @JsonKey(name: 'billing_username')
  final String? billingUsername;
  @JsonKey(name: 'billing_email')
  final String? billingEmail;
  @JsonKey(name: 'billing_number')
  final String? billingNumber;
  @JsonKey(name: 'billing_city')
  final String? billingCity;
  @JsonKey(name: 'billing_address')
  final String? billingAddress;
  @JsonKey(name: 'shpping_fname')
  final String? shippingFname;
  @JsonKey(name: 'shpping_lname')
  final String? shippingLname;
  @JsonKey(name: 'shpping_username')
  final String? shippingUsername;
  @JsonKey(name: 'shpping_email')
  final String? shippingEmail;
  @JsonKey(name: 'shpping_number')
  final String? shippingNumber;
  @JsonKey(name: 'shpping_city')
  final String? shippingCity;
  @JsonKey(name: 'shpping_address')
  final String? shippingAddress;

  UserData({
    this.billingEmail,
    this.lname,
    this.fname,
    this.address,
    this.billingFname,
    this.billingLname,
    this.billingUsername,
    this.billingNumber,
    this.billingCity,
    this.billingAddress,
    this.shippingFname,
    this.shippingLname,
    this.shippingUsername,
    this.shippingEmail,
    this.shippingNumber,
    this.shippingCity,
    this.shippingAddress,
    this.id,
    this.username,
    this.email,
    this.number,
    this.photo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
