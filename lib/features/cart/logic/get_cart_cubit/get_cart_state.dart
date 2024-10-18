part of 'get_cart_cubit.dart';

class GetCartState {}

class GetCartLoading extends GetCartState {}

class GetCartSuccess extends GetCartState {
  List<CartItem>? cart;
  GetCartSuccess(this.cart);
}

class GetCartFailure extends GetCartState {
  String? errMessage;
  GetCartFailure(this.errMessage);
}
