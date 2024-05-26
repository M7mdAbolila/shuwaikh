// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_shipping_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateShippingRequsetBody _$UpdateShippingRequsetBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateShippingRequsetBody(
      json['shpping_address'] as String?,
      json['shpping_fname'] as String?,
      json['shpping_lname'] as String?,
      json['shpping_city'] as String?,
      json['shpping_email'] as String?,
      json['shpping_number'] as String?,
    );

Map<String, dynamic> _$UpdateShippingRequsetBodyToJson(
        UpdateShippingRequsetBody instance) =>
    <String, dynamic>{
      'shpping_address': instance.address,
      'shpping_fname': instance.fname,
      'shpping_lname': instance.lname,
      'shpping_city': instance.city,
      'shpping_email': instance.email,
      'shpping_number': instance.number,
    };
