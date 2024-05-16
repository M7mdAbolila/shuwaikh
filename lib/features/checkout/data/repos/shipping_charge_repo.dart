import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/checkout/data/models/shipping_charge_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/shipping_charge_response.dart';

class ShippingChargeRepo {
  final ApiService _apiService;

  ShippingChargeRepo(this._apiService);

  Future<Either<Failure, List<Shipping>?>> shippingCharge(String? token,
      ShippingChargeRequsetBody shippingChargeRequsetBody) async {
    try {
      final response =
          await _apiService.shippingCharge(token, shippingChargeRequsetBody);
      return right(response.shipping);
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
