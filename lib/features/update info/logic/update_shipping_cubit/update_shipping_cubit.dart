import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/user_info_cachce.dart';
import '../../data/models/update_shipping_details/update_shipping_request_body.dart';
import '../../data/repos/update_shipping_repo.dart';

part 'update_shipping_state.dart';

class UpdateShippingCubit extends Cubit<UpdateShippingState> {
  final UpdateShippingRepo _updateShippingRepo;
  UpdateShippingCubit(this._updateShippingRepo) : super(UpdateShippingState());
  TextEditingController address = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();

  Future<void> updateShipping() async {
    emit(UpdateShippingLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();

    var result = await _updateShippingRepo.updateShipping(
      token,
      UpdateShippingRequsetBody(
        address.text,
        fname.text,
        lname.text,
        city.text,
        email.text,
        number.text,
      ),
    );
    result.fold(
      (failuer) => emit(
        UpdateShippingFailure(failuer.errMessage),
      ),
      (message) => emit(
        UpdateShippingSuccess(message),
      ),
    );
  }
}
