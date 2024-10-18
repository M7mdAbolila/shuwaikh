import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';

import '../models/update_billing_details/update_billing_request_body.dart';

class UpdateBillingRepo {
  final ApiService _apiService;

  UpdateBillingRepo(this._apiService);

  Future<Either<Failure, String?>> updateBilling(
      String? token, UpdateBillingRequsetBody updateBillingRequsetBody) async {
    try {
      final response =
          await _apiService.updateBilling(token, updateBillingRequsetBody);
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
