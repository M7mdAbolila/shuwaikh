import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_request_body.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_response.dart';

class ProductsPageRepo {
  final ApiService _apiService;

  ProductsPageRepo(this._apiService);
  Future<Either<Failure, ProductsPageResponse>> productsPage(String? token,
      ProductsPageRequestBody productsPageRequestBody) async {
    try {
      var response = await _apiService.productsPage(
       token,
        productsPageRequestBody,
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
