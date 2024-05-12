part of 'update_shipping_cubit.dart';

class UpdateShippingState {}

class UpdateShippingLoading extends UpdateShippingState {}

class UpdateShippingSuccess extends UpdateShippingState {
  final String? message;

  UpdateShippingSuccess(this.message);
}

class UpdateShippingFailure extends UpdateShippingState {
  final String? errMessage;

  UpdateShippingFailure(this.errMessage);
}
