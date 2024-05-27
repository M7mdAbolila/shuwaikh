import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_profile/update_profile_request_body.dart';
import 'package:shuwaikh/features/update%20info/data/repos/update_profile_repo.dart';

import '../../../../core/helpers/user_info_cachce.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepo _updateProfileRepo;
  UpdateProfileCubit(this._updateProfileRepo) : super(UpdateProfileState());
  TextEditingController address = TextEditingController();
  TextEditingController newPassowrd = TextEditingController();
  TextEditingController oldPassowrd = TextEditingController();
  File? photo;

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _updateProfileRepo.updateProfile(
      token,
      UpdateProfileRequestBody(
        address: address.text,
        newPassword: newPassowrd.text,
        oldPassword: oldPassowrd.text,
        photo: photo,
      ),
    );
    result.fold(
      (failuer) => emit(
        UpdateProfileFailure(failuer.errMessage),
      ),
      (message) => emit(
        UpdateProfileSuccess(message),
      ),
    );
  }
}
