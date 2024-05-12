part of 'update_billing_cubit.dart';

class UpdateBillingState {}

class UpdateBillingLoading extends UpdateBillingState {}

class UpdateBillingSuccess extends UpdateBillingState {
  final String? message;

  UpdateBillingSuccess(this.message);
}

class UpdateBillingFailure extends UpdateBillingState {
  final String? errMessage;

  UpdateBillingFailure(this.errMessage);
}
