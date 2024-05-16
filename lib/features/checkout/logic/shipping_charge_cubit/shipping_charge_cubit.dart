import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/checkout/data/models/shipping_charge_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/shipping_charge_response.dart';
import 'package:shuwaikh/features/checkout/data/repos/shipping_charge_repo.dart';

part 'shipping_charge_state.dart';

class ShippingChargeCubit extends Cubit<ShippingChargeState> {
  final ShippingChargeRepo _shippingChargeRepo;
  ShippingChargeCubit(this._shippingChargeRepo) : super(ShippingChargeState());

  Future<void> shippingCharge() async {
    emit(ShippingChargeLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _shippingChargeRepo.shippingCharge(
      token,
      ShippingChargeRequsetBody(
        lang: Intl.getCurrentLocale(),
      ),
    );
    result.fold(
      (failure) => emit(
        ShippingChargeFailure(failure.errMessage),
      ),
      (shipping) => emit(
        ShippingChargeSuccess(shipping),
      ),
    );
  }
}
