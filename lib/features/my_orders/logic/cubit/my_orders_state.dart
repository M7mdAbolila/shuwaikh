part of 'my_orders_cubit.dart';

class MyOrdersState {}

class MyOrdersLoading extends MyOrdersState {}

class MyOrdersSuccess extends MyOrdersState {
  final List<Order>? orders;

  MyOrdersSuccess(this.orders);
}

class MyOrdersFailure extends MyOrdersState {
  final String? errMessage;

  MyOrdersFailure(this.errMessage);
}
