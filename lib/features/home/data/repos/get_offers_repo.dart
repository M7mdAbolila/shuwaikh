import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/home/data/models/get_offers/get_offers_requset_body.dart';
import 'package:shuwaikh/features/home/data/models/get_offers/get_offers_response.dart';

import '../../../../core/networking/api_constants.dart';

class GetOffersRepo {
  final ApiService _apiService;

  GetOffersRepo(this._apiService);
  Future<Either<Failure, List<Offer>?>> getOffers(
      GetOffersRequsetBody getOffersRequsetBody) async {
    try {
      var response =
          await _apiService.getOffers(ApiConstants.token, getOffersRequsetBody);

      return right(response.offers);
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
