import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/vouncher/data/models/check_coupon_request_body.dart';
import 'package:shuwaikh/features/vouncher/data/repos/check_coupon_repo.dart';

part 'check_coupon_state.dart';

class CheckCouponCubit extends Cubit<CheckCouponState> {
  final CheckCouponRepo _checkCouponRepo;
  CheckCouponCubit(this._checkCouponRepo) : super(CheckCouponState());

  Future<void> checkCoupon(double? cartTotal, int? coupon) async {
    emit(CheckCouponLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _checkCouponRepo.checkCoupon(
      token,
      CheckCouponRequsetBody(
        cartTotal,
        coupon,
      ),
    );
    result.fold(
      (failure) => emit(
        CheckCouponFailure(failure.errMessage),
      ),
      (couponAmount) => emit(
        CheckCouponSuccess(couponAmount),
      ),
    );
  }
}
