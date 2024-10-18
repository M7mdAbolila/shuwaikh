// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestBody _$AddToCartRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddToCartRequestBody(
      productId: (json['product_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      productPrice: (json['product_price'] as num?)?.toDouble(),
      variations: json['variations'] as String?,
      variationsPrice: (json['variations_price'] as num?)?.toDouble(),
      addons: json['addons'] as String?,
      addonsPrice: (json['addons_price'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddToCartRequestBodyToJson(
        AddToCartRequestBody instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'title': instance.title,
      'qty': instance.qty,
      'product_price': instance.productPrice,
      'variations': instance.variations,
      'variations_price': instance.variationsPrice,
      'addons': instance.addons,
      'addons_price': instance.addonsPrice,
      'total': instance.total,
    };
