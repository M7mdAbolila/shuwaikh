import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';

import '../models/update_shipping_details/update_shipping_request_body.dart';

class UpdateShippingRepo {
  final ApiService _apiService;

  UpdateShippingRepo(this._apiService);

  Future<Either<Failure, String?>> updateShipping(
      String? token, UpdateShippingRequsetBody updateShippingRequsetBody) async {
    try {
      final response =
          await _apiService.updateShipping(token, updateShippingRequsetBody);
      return right(response.message);
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
