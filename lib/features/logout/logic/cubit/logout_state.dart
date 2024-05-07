// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'logout_cubit.dart';

class LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutFailure extends LogoutState {
  String? errMessage;
  LogoutFailure({
     this.errMessage,
  });
}
