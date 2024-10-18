import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/my_orders/data/models/my_orders_response.dart';

class MyOrdersRepo {
  final ApiService _apiService;

  MyOrdersRepo(this._apiService);
  Future<Either<Failure, MyOrdersResponse>> getMyOrders(String? token) async {
    try {
      final response = await _apiService.getMyOrder(token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
