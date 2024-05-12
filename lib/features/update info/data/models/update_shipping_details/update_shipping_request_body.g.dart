// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_shipping_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateShippingRequsetBody _$UpdateShippingRequsetBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateShippingRequsetBody(
      json['shipping_address'] as String?,
      json['shipping_fname'] as String?,
      json['shipping_lname'] as String?,
      json['shipping_city'] as String?,
      json['shipping_email'] as String?,
      json['shipping_number'] as String?,
    );

Map<String, dynamic> _$UpdateShippingRequsetBodyToJson(
        UpdateShippingRequsetBody instance) =>
    <String, dynamic>{
      'shipping_address': instance.address,
      'shipping_fname': instance.fname,
      'shipping_lname': instance.lname,
      'shipping_city': instance.city,
      'shipping_email': instance.email,
      'shipping_number': instance.number,
    };
