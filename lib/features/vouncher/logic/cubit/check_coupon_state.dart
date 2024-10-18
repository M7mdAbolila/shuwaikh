part of 'check_coupon_cubit.dart';

class CheckCouponState {}

class CheckCouponLoading extends CheckCouponState {}

class CheckCouponSuccess extends CheckCouponState {
  final double? couponAmount;

  CheckCouponSuccess(this.couponAmount);
}

class CheckCouponFailure extends CheckCouponState {
  final String? errMessage;

  CheckCouponFailure(this.errMessage);
}
