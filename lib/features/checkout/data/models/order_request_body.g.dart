// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequestBody _$OrderRequestBodyFromJson(Map<String, dynamic> json) =>
    OrderRequestBody(
      gateway: json['gateway'] as String,
      shippingFname: json['shipping_fname'] as String,
      shippingLname: json['shipping_lname'] as String,
      shippingEmail: json['shipping_email'] as String,
      shippingNumber: json['shipping_number'] as String,
      shippingCity: json['shipping_city'] as String,
      shippingAddress: json['shipping_address'] as String,
      sameAsShipping: (json['same_as_shipping'] as num?)?.toInt(),
      billingLname: json['billing_lname'] as String?,
      billingFname: json['billing_fname'] as String?,
      billingEmail: json['billing_email'] as String?,
      billingNumber: json['billing_number'] as String?,
      billingCity: json['billing_city'] as String?,
      billingAddress: json['billing_address'] as String?,
      shippingCharge: (json['shipping_charge'] as num).toInt(),
      discount: (json['discount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderRequestBodyToJson(OrderRequestBody instance) =>
    <String, dynamic>{
      'gateway': instance.gateway,
      'shipping_fname': instance.shippingFname,
      'shipping_lname': instance.shippingLname,
      'shipping_email': instance.shippingEmail,
      'shipping_number': instance.shippingNumber,
      'shipping_city': instance.shippingCity,
      'shipping_address': instance.shippingAddress,
      'same_as_shipping': instance.sameAsShipping,
      'billing_lname': instance.billingLname,
      'billing_fname': instance.billingFname,
      'billing_email': instance.billingEmail,
      'billing_number': instance.billingNumber,
      'billing_city': instance.billingCity,
      'billing_address': instance.billingAddress,
      'shipping_charge': instance.shippingCharge,
      'discount': instance.discount,
    };
