import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_result.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/login/data/models/login_request_body.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
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
