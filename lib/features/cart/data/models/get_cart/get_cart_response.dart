import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response.g.dart';

@JsonSerializable()
class GetCartResponse {
  final String? message;
  final List<CartItem>? cart;
  GetCartResponse({this.message, this.cart});
  factory GetCartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseFromJson(json);
}

@JsonSerializable()
class CartItem {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'product_id')
  int? productId;
  String? title;
  String? variations;
  String? addons;
  @JsonKey(name: 'variations_price')
  double? variationsPrice;
  @JsonKey(name: 'addons_price')
  double? addonsPrice;
  @JsonKey(name: 'product_price')
  String? productPrice;
  String? total;
  int? qty;
  @JsonKey(name: 'product_image')
  String? image;
  CartItem({
    this.id,
    this.userId,
    this.productId,
    this.title,
    this.variations,
    this.addons,
    this.variationsPrice,
    this.addonsPrice,
    this.productPrice,
    this.total,
    this.qty,
    this.image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
