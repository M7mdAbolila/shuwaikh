import 'package:json_annotation/json_annotation.dart';

part 'shipping_charge_request_body.g.dart';

@JsonSerializable()
class ShippingChargeRequsetBody {
  final String lang;

  ShippingChargeRequsetBody({required this.lang});
  Map<String, dynamic> toJson() => _$ShippingChargeRequsetBodyToJson(this);
}
