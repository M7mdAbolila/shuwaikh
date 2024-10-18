import 'package:json_annotation/json_annotation.dart';

part 'shipping_charge_response.g.dart';

@JsonSerializable()
class ShippingChargeResponse {
  final String? message;
  final List<Shipping>? shipping;

  ShippingChargeResponse({this.message, this.shipping});
  factory ShippingChargeResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingChargeResponseFromJson(json);
}

@JsonSerializable()
class Shipping {
  final int? id;
  final String? title;
  final String? text;
  final String? charge;
  @JsonKey(name: 'free_delivery_amount')
  final String? freeDeliveryAmout;

  Shipping(
      {this.id, this.title, this.text, this.charge, this.freeDeliveryAmout});
  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);
}
