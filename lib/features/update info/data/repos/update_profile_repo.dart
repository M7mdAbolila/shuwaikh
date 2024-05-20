import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_profile/update_profile_request_body.dart';

class UpdateProfileRepo {
  final ApiService _apiService;

  UpdateProfileRepo(this._apiService);

  Future<Either<Failure, String?>> updateProfile(
      String? token, UpdateProfileRequestBody requestBody) async {
    try {
      final response = await _apiService.updateProfile(
        token,
        requestBody.photo,
        requestBody.address,
        requestBody.newPassword,
        requestBody.oldPassword,
      );
      return right(response.message);
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
