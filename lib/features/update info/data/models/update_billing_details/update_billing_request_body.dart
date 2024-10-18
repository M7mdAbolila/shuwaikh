import 'package:json_annotation/json_annotation.dart';

part 'update_billing_request_body.g.dart';

@JsonSerializable()
class UpdateBillingRequsetBody {
  @JsonKey(name: 'billing_address')
  final String? address;
  @JsonKey(name: 'billing_fname')
  final String? fname;
  @JsonKey(name: 'billing_lname')
  final String? lname;
  @JsonKey(name: 'billing_city')
  final String? city;
  @JsonKey(name: 'billing_email')
  final String? email;
  @JsonKey(name: 'billing_number')
  final String? number;

  UpdateBillingRequsetBody(
      this.address, this.fname, this.lname, this.city, this.email, this.number);

  Map<String, dynamic> toJson() => _$UpdateBillingRequsetBodyToJson(this);
}
