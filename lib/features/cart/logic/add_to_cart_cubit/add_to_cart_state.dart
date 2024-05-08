// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_cart_cubit.dart';

class AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
  String? message;
  AddToCartSuccess(
    this.message,
  );
}

class AddToCartFailure extends AddToCartState {
  String? errMessage;
  AddToCartFailure(this.errMessage);
}
