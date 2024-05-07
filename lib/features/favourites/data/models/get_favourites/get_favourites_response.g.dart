// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favourites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavouritesResponse _$GetFavouritesResponseFromJson(
        Map<String, dynamic> json) =>
    GetFavouritesResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FavouriteProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFavouritesResponseToJson(
        GetFavouritesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

FavouriteProduct _$FavouriteProductFromJson(Map<String, dynamic> json) =>
    FavouriteProduct(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$FavouriteProductToJson(FavouriteProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'user_id': instance.userId,
    };
