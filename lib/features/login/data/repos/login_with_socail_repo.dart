import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';
import 'package:shuwaikh/features/login/data/models/login_with_socail_request_body.dart';

class LoginWithSocailRepo {
  final ApiService _apiService;

  LoginWithSocailRepo(this._apiService);
  Future<Either<Failure, LoginResponse>> loginWithSocail(
    LoginWithSocailRequestBody loginWithSocailRequestBody,
  ) async {
    try {
      var response =
          await _apiService.loginWithSocail(loginWithSocailRequestBody);
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
