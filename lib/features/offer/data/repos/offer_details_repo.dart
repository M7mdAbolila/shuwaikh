import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/offer/data/models/offer_details_respone.dart';

class OfferDetailsRepo {
  final ApiService _apiService;

  OfferDetailsRepo(this._apiService);

  Future<Either<Failure, OfferDetailsResponse>> getOfferDetails(
      String? token, int? id) async {
    try {
      var response = await _apiService.getOfferDetails(id.toString(), token);
      return right(response);
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
