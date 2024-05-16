// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCouponResponse _$CheckCouponResponseFromJson(Map<String, dynamic> json) =>
    CheckCouponResponse(
      message: json['message'] as String?,
      couponAmount: (json['couponAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CheckCouponResponseToJson(
        CheckCouponResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'couponAmount': instance.couponAmount,
    };
