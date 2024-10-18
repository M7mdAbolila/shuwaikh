part of 'profile_cubit.dart';

class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserData? userData;

  ProfileSuccess(this.userData);
}

class ProfileFailure extends ProfileState {
  final String? errmessage;

  ProfileFailure(this.errmessage);
}
