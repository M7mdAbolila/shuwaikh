import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  final String? message;

  OrderResponse(this.message);
  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}
