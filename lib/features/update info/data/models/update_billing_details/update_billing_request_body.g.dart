// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_billing_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBillingRequsetBody _$UpdateBillingRequsetBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateBillingRequsetBody(
      json['billing_address'] as String?,
      json['billing_fname'] as String?,
      json['billing_lname'] as String?,
      json['billing_city'] as String?,
      json['billing_email'] as String?,
      json['billing_number'] as String?,
    );

Map<String, dynamic> _$UpdateBillingRequsetBodyToJson(
        UpdateBillingRequsetBody instance) =>
    <String, dynamic>{
      'billing_address': instance.address,
      'billing_fname': instance.fname,
      'billing_lname': instance.lname,
      'billing_city': instance.city,
      'billing_email': instance.email,
      'billing_number': instance.number,
    };
