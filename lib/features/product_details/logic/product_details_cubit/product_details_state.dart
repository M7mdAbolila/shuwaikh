part of 'product_details_cubit.dart';

class ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetails? productDetails;

  ProductDetailsSuccess(this.productDetails);
}

class ProductDetailsFailure extends ProductDetailsState {
  final String errMessage;
  ProductDetailsFailure(this.errMessage);
}
