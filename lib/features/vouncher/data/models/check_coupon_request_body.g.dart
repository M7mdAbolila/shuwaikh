// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_coupon_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCouponRequsetBody _$CheckCouponRequsetBodyFromJson(
        Map<String, dynamic> json) =>
    CheckCouponRequsetBody(
      (json['cart_total'] as num?)?.toDouble(),
      (json['coupon'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckCouponRequsetBodyToJson(
        CheckCouponRequsetBody instance) =>
    <String, dynamic>{
      'cart_total': instance.cartTotal,
      'coupon': instance.coupon,
    };
