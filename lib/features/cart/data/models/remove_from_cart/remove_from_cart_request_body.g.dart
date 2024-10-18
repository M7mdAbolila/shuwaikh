// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_from_cart_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveFromCartRequestBody _$RemoveFromCartRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RemoveFromCartRequestBody(
      productId: (json['product_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RemoveFromCartRequestBodyToJson(
        RemoveFromCartRequestBody instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
    };
