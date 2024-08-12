import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';

class DeleteAccountRepo {
  final ApiService _apiService;

  DeleteAccountRepo(this._apiService);
  Future<Either<Failure, String>> deleteAccount(String token) async {
    try {
      var response = await _apiService.unactiveAccount(token);
      return right(response.message!);
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
