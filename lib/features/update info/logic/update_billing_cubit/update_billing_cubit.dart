import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_billing_details/update_billing_request_body.dart';

import '../../../../core/helpers/user_info_cachce.dart';
import '../../data/repos/update_billing_repo.dart';

part 'update_billing_state.dart';

class UpdateBillingCubit extends Cubit<UpdateBillingState> {
  final UpdateBillingRepo _updateBillingRepo;
  UpdateBillingCubit(this._updateBillingRepo) : super(UpdateBillingState());
  TextEditingController address = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();

  Future<void> updateBilling() async {
    emit(UpdateBillingLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();

    var result = await _updateBillingRepo.updateBilling(
      token,
      UpdateBillingRequsetBody(
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
        UpdateBillingFailure(failuer.errMessage),
      ),
      (message) => emit(
        UpdateBillingSuccess(message),
      ),
    );
  }
}
