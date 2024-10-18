part of 'update_profile_cubit.dart';

class UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final String? message;

  UpdateProfileSuccess(this.message);
}

class UpdateProfileFailure extends UpdateProfileState {
  final String? errMessage;

  UpdateProfileFailure(this.errMessage);
}
