part of 'login_cubit.dart';

class LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}
