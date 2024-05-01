import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/home/data/repos/get_coupons_repo.dart';

import '../../data/models/get_coupons/get_coupons_response.dart';

part 'get_coupons_state.dart';

class GetCouponsCubit extends Cubit<GetCouponsState> {
  GetCouponsCubit(this._getCouponsRepo) : super(GetCouponsInitial());

  final GetCouponsRepo _getCouponsRepo;
  Future<void> getCoupons() async {
    emit(GetCouponsLoading());
    var result = await _getCouponsRepo.getCoupons();

    result.fold(
      (failure) => emit(GetCouponsFailure(failure.errMessage)),
      (coupons) => emit(
        GetCouponsSuccess(coupons),
      ),
    );
  }
}
