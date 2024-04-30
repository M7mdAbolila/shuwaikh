import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_requset_body.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';
// import 'package:shuwaikh/features/home/data/repos/home_repo.dart';

class HomeRepoImpl
//  implements HomeRepo
{
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);
  // @override
  Future<Either<Failure, List<Category>?>> getCategories(
      GetCategoriesRequsetBody getCategoriesRequsetBody) async {
    try {
      var response = await _apiService.getCategories(getCategoriesRequsetBody);

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
