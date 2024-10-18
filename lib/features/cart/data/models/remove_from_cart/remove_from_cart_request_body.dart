import 'package:json_annotation/json_annotation.dart';

part 'remove_from_cart_request_body.g.dart';

@JsonSerializable()
class RemoveFromCartRequestBody {
  @JsonKey(name: 'product_id')
  final int? productId;
  RemoveFromCartRequestBody({required this.productId});
  Map<String, dynamic> toJson() => _$RemoveFromCartRequestBodyToJson(this);
}
