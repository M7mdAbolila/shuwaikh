// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request_body.g.dart';

@JsonSerializable()
class AddToCartRequestBody {
  @JsonKey(name: 'product_id')
  final int? productId;
  final String? title;
  final int? qty;
  @JsonKey(name: 'product_price')
  final double? productPrice;
  final String? variations;
  @JsonKey(name: 'variations_price')
  final double? variationsPrice;
  final String? addons;
  @JsonKey(name: 'addons_price')
  final double? addonsPrice;
  final double? total;
  AddToCartRequestBody({
    required this.productId,
    required this.title,
    required this.qty,
    required this.productPrice,
    this.variations,
    required this.variationsPrice,
    this.addons,
    required this.addonsPrice,
    required this.total,
  });

  Map<String, dynamic> toJson() => _$AddToCartRequestBodyToJson(this);
}
