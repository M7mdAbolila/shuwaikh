import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/cart/data/models/remove_from_cart/remove_from_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/models/remove_from_cart/remove_from_cart_response.dart';

class RemoveFromCartRepo {
  final ApiService _apiService;

  RemoveFromCartRepo(this._apiService);

  Future<Either<Failure, RemoveFromCartResponse>> removeFromCart(
    String? token,
    RemoveFromCartRequestBody removeFromCartRequestBody,
  ) async {
    try {
      final response =
          await _apiService.removeFromCart(token, removeFromCartRequestBody);
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
