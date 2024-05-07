import 'package:json_annotation/json_annotation.dart';
part 'is_favourite_request_body.g.dart';

@JsonSerializable()
class IsFavouriteRequestBody {
  @JsonKey(name: 'product_id')
  final String productIdp;

  IsFavouriteRequestBody({required this.productIdp});
  Map<String, dynamic> toJson() => _$IsFavouriteRequestBodyToJson(this);
}
