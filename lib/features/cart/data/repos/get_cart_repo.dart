import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';

import '../models/get_cart/get_cart_response.dart';

class GetCartRepo {
  final ApiService _apiService;

  GetCartRepo(this._apiService);

  Future<Either<Failure, List<CartItem>?>> getCart(String? token) async {
    try {
      final response = await _apiService.getCart(token);
      return right(response.cart);
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
