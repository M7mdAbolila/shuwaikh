import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_result.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(
          ServerFailure.fromDioError(e),
        );
      }
      return ApiResult.failure(
        ServerFailure(e.toString()),
      );
    }
  }
}
