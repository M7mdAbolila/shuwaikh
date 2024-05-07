import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/logout/data/models/logout_response.dart';

class LogoutRepo {
  final ApiService _apiService;

  LogoutRepo(this._apiService);

  Future<Either<Failure, LogoutResponse>> logout(String? token) async {
    try {
      var response = await _apiService.logout(token);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
