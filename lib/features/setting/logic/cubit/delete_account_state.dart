part of 'delete_account_cubit.dart';

class DeleteAccountState {}

class DeleteAccountSuccess extends DeleteAccountState {
  final String message;

  DeleteAccountSuccess(this.message);
}

class DeleteAccountFailure extends DeleteAccountState {
  final String errMessage;

  DeleteAccountFailure(this.errMessage);
}

class DeleteAccountLoading extends DeleteAccountState {}
