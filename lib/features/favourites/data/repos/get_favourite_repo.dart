import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/favourites/data/models/get_favourites/get_favourites_response.dart';

import '../../../../core/networking/failure.dart';

class GetFavouriteRepo {
  final ApiService _apiService;
  GetFavouriteRepo(this._apiService);

  Future<Either<Failure, List<FavouriteProduct>?>> getFavourite(
      String? token) async {
    try {
      var response = await _apiService.getFavourites(token);
      return right(response.data);
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
