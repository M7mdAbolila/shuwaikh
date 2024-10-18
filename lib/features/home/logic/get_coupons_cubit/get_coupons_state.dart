part of 'get_coupons_cubit.dart';




class GetCouponsState {}

class GetCouponsInitial extends GetCouponsState {}

class GetCouponsLoading extends GetCouponsState {}

class GetCouponsSuccess extends GetCouponsState {
  final List<Coupon>? coupons;

  GetCouponsSuccess(this.coupons);
}

class GetCouponsFailure extends GetCouponsState {
  final String errMessage;

  GetCouponsFailure(this.errMessage);

}
