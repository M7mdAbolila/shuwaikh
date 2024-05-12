import 'package:json_annotation/json_annotation.dart';

part 'get_favourites_response.g.dart';

@JsonSerializable()
class GetFavouritesResponse {
  String? message;
  List<FavouriteProduct>? data;
  GetFavouritesResponse({this.message, this.data});
  factory GetFavouritesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFavouritesResponseFromJson(json);
}

@JsonSerializable()
class FavouriteProduct {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'feature_image')
  String? image;
  String? title;
  @JsonKey(name: 'current_price')
  String? price;
  FavouriteProduct({this.id, this.productId, this.userId});

  factory FavouriteProduct.fromJson(Map<String, dynamic> json) =>
      _$FavouriteProductFromJson(json);
}
