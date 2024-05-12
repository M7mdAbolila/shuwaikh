import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';

import '../../../../core/networking/failure.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<Either<Failure, UserData?>> getProfileData(String? token) async {
    try {
      final response = await _apiService.getProfileData(token);
      return right(response.userData);
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
