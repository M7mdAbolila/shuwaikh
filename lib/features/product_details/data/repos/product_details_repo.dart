import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/product_details/data/models/product_details_response.dart';

import '../../../../core/networking/failure.dart';

class ProductDetailsRepo {
  final ApiService _apiService;

  ProductDetailsRepo(this._apiService);
  Future<Either<Failure, ProductDetailsResponse>> getProductDetails(
      String? token, String id) async {
    try {
      var response = await _apiService.getProductDetails(id, token);
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
