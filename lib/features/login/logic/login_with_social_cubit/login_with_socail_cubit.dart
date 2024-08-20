import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:shuwaikh/core/helpers/login_with_socail_service.dart';
import 'package:shuwaikh/core/networking/failure.dart';
import 'package:shuwaikh/features/login/data/models/login_with_socail_request_body.dart';
import 'package:shuwaikh/features/login/data/repos/login_with_socail_repo.dart';

import '../../data/models/login_response.dart';

part 'login_with_socail_state.dart';

class LoginWithSocailCubit extends Cubit<LoginWithSocailState> {
  final LoginWithSocailRepo _loginWithSocailRepo;
  LoginWithSocailCubit(this._loginWithSocailRepo)
      : super(LoginWithSocailState());

  Future<void> loginWithSocail({
    required String provider,
  }) async {
    Either<Failure, LoginWithSocailRequestBody?> resultService;
    if (provider == 'google') {
      resultService = await LoginWithSocailService().loginWithGoogle();
    } else if (provider == 'facebook') {
      resultService = await LoginWithSocailService().loginWithFacebook();
    } else {
      resultService = await LoginWithSocailService().loginWithGoogle();
    }
    resultService.fold(
      (failure) => emit(
        LoginWithSocailFailure(
          failure.errMessage,
        ),
      ),
      (loginBody) async {
        emit(LoginWithSocailLoading());
        if (loginBody != null) {
          final result = await _loginWithSocailRepo.loginWithSocail(loginBody);
          result.fold(
            (failure) => emit(
              LoginWithSocailFailure(failure.errMessage),
            ),
            (loginResponse) => emit(
              LoginWithSocailSuccess(loginResponse),
            ),
          );
        }
      },
    );
  }
}
