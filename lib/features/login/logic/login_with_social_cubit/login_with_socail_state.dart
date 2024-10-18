part of 'login_with_socail_cubit.dart';

class LoginWithSocailState {}

class LoginWithSocailLoading extends LoginWithSocailState {}

class LoginWithSocailSuccess extends LoginWithSocailState {
  final LoginResponse loginResponse;

  LoginWithSocailSuccess(this.loginResponse);
}

class LoginWithSocailFailure extends LoginWithSocailState {
  final String errMessage;

  LoginWithSocailFailure(this.errMessage);
}
