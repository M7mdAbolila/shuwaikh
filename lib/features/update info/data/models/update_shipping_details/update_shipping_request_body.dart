import 'package:json_annotation/json_annotation.dart';

part 'update_shipping_request_body.g.dart';

@JsonSerializable()
class UpdateShippingRequsetBody {
  @JsonKey(name: 'shipping_address')
  final String? address;
  @JsonKey(name: 'shipping_fname')
  final String? fname;
  @JsonKey(name: 'shipping_lname')
  final String? lname;
  @JsonKey(name: 'shipping_city')
  final String? city;
  @JsonKey(name: 'shipping_email')
  final String? email;
  @JsonKey(name: 'shipping_number')
  final String? number;

  UpdateShippingRequsetBody(
      this.address, this.fname, this.lname, this.city, this.email, this.number);

  Map<String, dynamic> toJson() => _$UpdateShippingRequsetBodyToJson(this);
}
