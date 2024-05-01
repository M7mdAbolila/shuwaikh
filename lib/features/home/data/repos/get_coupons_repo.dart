import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/home/data/models/get_coupons/get_coupons_response.dart';
import '../../../../core/networking/api_constants.dart';

class GetCouponsRepo {
  final ApiService _apiService;

  GetCouponsRepo(this._apiService);
  Future<Either<Failure, List<Coupon>?>> getCoupons() async {
    try {
      var response = await _apiService.getCoupons(ApiConstants.token);

      return right(response.coupons);
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
