import 'package:json_annotation/json_annotation.dart';

part 'update_shipping_response.g.dart';

@JsonSerializable()
class UpdateShippingResponse {
  final String? message;
  UpdateShippingResponse(this.message);
  factory UpdateShippingResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateShippingResponseFromJson(json);
}
