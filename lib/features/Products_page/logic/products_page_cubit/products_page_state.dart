part of 'products_page_cubit.dart';

class ProductsPageState {}

class ProductsPageInitial extends ProductsPageState {}

class ProductsPageLoading extends ProductsPageState {}

class ProductsPageSuccess extends ProductsPageState {
  final ProductsPageResponse productsPageResponse;

  ProductsPageSuccess(this.productsPageResponse);
}

class ProductsPageFailure extends ProductsPageState {
  final String errMessage;

  ProductsPageFailure(this.errMessage);
}
