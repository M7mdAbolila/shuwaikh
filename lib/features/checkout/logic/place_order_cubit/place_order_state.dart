part of 'place_order_cubit.dart';

class PlaceOrderState {}

class PlaceOrderLoading extends PlaceOrderState {}

class PlaceOrderSuccess extends PlaceOrderState {
  final OrderResponse orderResponse;

  PlaceOrderSuccess(this.orderResponse);
}

class PlaceOrderFailure extends PlaceOrderState {
  final String? errMessage;

  PlaceOrderFailure(this.errMessage);
}
