// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartResponse _$GetCartResponseFromJson(Map<String, dynamic> json) =>
    GetCartResponse(
      message: json['message'] as String?,
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCartResponseToJson(GetCartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'cart': instance.cart,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      variations: json['variations'] as String?,
      addons: json['addons'] as String?,
      variationsPrice: (json['variations_price'] as num?)?.toDouble(),
      addonsPrice: (json['addons_price'] as num?)?.toDouble(),
      productPrice: json['product_price'] as String?,
      total: json['total'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      image: json['product_image'] as String?,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'title': instance.title,
      'variations': instance.variations,
      'addons': instance.addons,
      'variations_price': instance.variationsPrice,
      'addons_price': instance.addonsPrice,
      'product_price': instance.productPrice,
      'total': instance.total,
      'qty': instance.qty,
      'product_image': instance.image,
    };
