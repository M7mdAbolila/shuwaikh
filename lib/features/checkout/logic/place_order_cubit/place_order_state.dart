part of 'place_order_cubit.dart';

class PlaceOrderState {}

class PlaceOrderLoading extends PlaceOrderState {}

class PlaceOrderSuccess extends PlaceOrderState {
  final String? message;

  PlaceOrderSuccess(this.message);
}

class PlaceOrderFailure extends PlaceOrderState {
   final String? errMessage;

  PlaceOrderFailure(this.errMessage);
}
