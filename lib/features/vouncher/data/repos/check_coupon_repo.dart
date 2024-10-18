import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/features/vouncher/data/models/check_coupon_request_body.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/failure.dart';

class CheckCouponRepo {
  final ApiService _apiService;

  CheckCouponRepo(this._apiService);
  Future<Either<Failure, double?>> checkCoupon(
      String? token, CheckCouponRequsetBody checkCouponRequsetBody) async {
    try {
      final response =
          await _apiService.checkCoupon(token, checkCouponRequsetBody);
      return right(response.couponAmount);
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
