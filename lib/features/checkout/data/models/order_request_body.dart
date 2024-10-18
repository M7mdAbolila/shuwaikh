import 'package:json_annotation/json_annotation.dart';

part 'order_request_body.g.dart';

@JsonSerializable()
class OrderRequestBody {
  final String gateway;
  @JsonKey(name: 'shipping_fname')
  String shippingFname;
  @JsonKey(name: 'shipping_lname')
  String shippingLname;
  @JsonKey(name: 'shipping_email')
  String shippingEmail;
  @JsonKey(name: 'shipping_number')
  String shippingNumber;
  @JsonKey(name: 'shipping_city')
  String shippingCity;
  @JsonKey(name: 'shipping_address')
  String shippingAddress;
  @JsonKey(name: 'same_as_shipping')
  int? sameAsShipping;
  @JsonKey(name: 'billing_lname')
  String? billingLname;
  @JsonKey(name: 'billing_fname')
  String? billingFname;
  @JsonKey(name: 'billing_email')
  String? billingEmail;
  @JsonKey(name: 'billing_number')
  String? billingNumber;
  @JsonKey(name: 'billing_city')
  String? billingCity;
  @JsonKey(name: 'billing_address')
  String? billingAddress;
  @JsonKey(name: 'shipping_charge')
  int shippingCharge;
  double? discount;
  OrderRequestBody({
    required this.gateway,
    required this.shippingFname,
    required this.shippingLname,
    required this.shippingEmail,
    required this.shippingNumber,
    required this.shippingCity,
    required this.shippingAddress,
    required this.sameAsShipping,
    this.billingLname,
    this.billingFname,
    this.billingEmail,
    this.billingNumber,
    this.billingCity,
    this.billingAddress,
    required this.shippingCharge,
    this.discount,
  });

  Map<String, dynamic> toJson() => _$OrderRequestBodyToJson(this);
}
