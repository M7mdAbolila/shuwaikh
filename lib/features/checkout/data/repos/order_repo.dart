import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/checkout/data/models/order_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/order_response.dart';

class OrderRepo {
  final ApiService _apiService;

  OrderRepo(this._apiService);

  Future<Either<Failure, OrderResponse>> placeOrder(
      String? token, OrderRequestBody orderRequestBody) async {
    try {
      final response = await _apiService.placeOrder(token, orderRequestBody);
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
