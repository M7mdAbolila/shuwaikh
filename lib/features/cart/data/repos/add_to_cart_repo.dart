import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_response.dart';

class AddToCartRepo {
  final ApiService _apiService;

  AddToCartRepo(this._apiService);

  Future<Either<Failure, AddToCartResponse>> addToCart(
      String? token, AddToCartRequestBody addToCartRequestBody) async {
    try {
      var response = await _apiService.addToCart(token, addToCartRequestBody);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
