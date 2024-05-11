part of 'remove_from_cart_cubit.dart';

class RemoveFromCartState {}

class RemoveFromCartLoading extends RemoveFromCartState {}

class RemoveFromCartSuccess extends RemoveFromCartState {
  String? message;
  RemoveFromCartSuccess(this.message);
}

class RemoveFromCartFailure extends RemoveFromCartState {
  String? errMessage;
  RemoveFromCartFailure(this.errMessage);
}
