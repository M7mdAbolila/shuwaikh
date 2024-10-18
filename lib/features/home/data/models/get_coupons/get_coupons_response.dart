
import 'package:json_annotation/json_annotation.dart';

part 'get_coupons_response.g.dart';


@JsonSerializable()
class GetCouponsResponse {
  final String? message;
  final List<Coupon>? coupons;

  GetCouponsResponse({
    this.coupons,
    this.message,
  });

  factory GetCouponsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCouponsResponseFromJson(json);
}

@JsonSerializable()
class Coupon {
  final int? id;
  final String? name;
  final String? code;
  final String? type;
  final String? value;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'minimum_spend')
  final String? minimumSpend;


  Coupon({this.id, this.name, this.code, this.type, this.value, this.endDate, this.minimumSpend});

  factory Coupon.fromJson(Map<String, dynamic> json) =>
      _$CouponFromJson(json);
}
