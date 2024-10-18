import 'package:json_annotation/json_annotation.dart';

part 'check_coupon_request_body.g.dart';

@JsonSerializable()
class CheckCouponRequsetBody {
  @JsonKey(name: 'cart_total')
  final double? cartTotal;
  final int? coupon;

  CheckCouponRequsetBody(this.cartTotal, this.coupon);
  Map<String, dynamic> toJson() => _$CheckCouponRequsetBodyToJson(this);
}
