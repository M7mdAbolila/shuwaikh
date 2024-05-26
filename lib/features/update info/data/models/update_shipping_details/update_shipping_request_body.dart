import 'package:json_annotation/json_annotation.dart';

part 'update_shipping_request_body.g.dart';

@JsonSerializable()
class UpdateShippingRequsetBody {
  @JsonKey(name: 'shpping_address')
  final String? address;
  @JsonKey(name: 'shpping_fname')
  final String? fname;
  @JsonKey(name: 'shpping_lname')
  final String? lname;
  @JsonKey(name: 'shpping_city')
  final String? city;
  @JsonKey(name: 'shpping_email')
  final String? email;
  @JsonKey(name: 'shpping_number')
  final String? number;

  UpdateShippingRequsetBody(
      this.address, this.fname, this.lname, this.city, this.email, this.number);

  Map<String, dynamic> toJson() => _$UpdateShippingRequsetBodyToJson(this);
}
