import 'package:json_annotation/json_annotation.dart';

part 'check_coupon_response.g.dart';

@JsonSerializable()
class CheckCouponResponse {
  final String? message;
  final double? couponAmount;

  CheckCouponResponse({this.message, this.couponAmount});
  factory CheckCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckCouponResponseFromJson(json);
}
