import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/favourites/data/models/is_favourite/is_favourite_request_body.dart';
import 'package:shuwaikh/features/favourites/data/models/is_favourite/is_favourite_response.dart';

import '../../../../core/networking/failure.dart';

class IsFavouriteRepo {
  final ApiService _apiService;

  IsFavouriteRepo(this._apiService);
  Future<Either<Failure, IsFavouritResponse>> isFavourite(
    String? token,
    IsFavouriteRequestBody isFavouriteRequestBody,
  ) async {
    try {
      var response =
          await _apiService.isFavourites(token, isFavouriteRequestBody);
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
