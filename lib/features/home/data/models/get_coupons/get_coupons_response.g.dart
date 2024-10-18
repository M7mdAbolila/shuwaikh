// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_coupons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCouponsResponse _$GetCouponsResponseFromJson(Map<String, dynamic> json) =>
    GetCouponsResponse(
      coupons: (json['coupons'] as List<dynamic>?)
          ?.map((e) => Coupon.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetCouponsResponseToJson(GetCouponsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'coupons': instance.coupons,
    };

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
      endDate: json['end_date'] as String?,
      minimumSpend: json['minimum_spend'] as String?,
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'value': instance.value,
      'end_date': instance.endDate,
      'minimum_spend': instance.minimumSpend,
    };
