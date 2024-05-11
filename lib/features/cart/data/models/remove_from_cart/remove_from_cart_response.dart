import 'package:json_annotation/json_annotation.dart';

part 'remove_from_cart_response.g.dart';

@JsonSerializable()
class RemoveFromCartResponse {
  final String? message;

  RemoveFromCartResponse(this.message);
  factory RemoveFromCartResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFromCartResponseFromJson(json);
}
