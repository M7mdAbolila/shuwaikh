import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_requset_body.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';

class GetCategoriesRepo {
  final ApiService _apiService;

  GetCategoriesRepo(this._apiService);
  Future<Either<Failure, List<Category>?>> getCategories(String? token,
      GetCategoriesRequsetBody getCategoriesRequsetBody) async {
    try {
      var response = await _apiService.getCategories(token,getCategoriesRequsetBody,);

      return right(response.categories);
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
