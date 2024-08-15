import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/login_with_socail_service.dart';
import 'package:shuwaikh/features/login/data/repos/login_with_socail_repo.dart';

import '../../data/models/login_response.dart';

part 'login_with_socail_state.dart';

class LoginWithSocailCubit extends Cubit<LoginWithSocailState> {
  final LoginWithSocailRepo _loginWithSocailRepo;
  LoginWithSocailCubit(this._loginWithSocailRepo)
      : super(LoginWithSocailState());

  Future<void> loginWithSocail() async {
    final resultService = await LoginWithSocailService().loginWithGoogle();
    resultService.fold(
      (failure) => emit(
        LoginWithSocailFailure(
          failure.errMessage,
        ),
      ),
      (loginBody) async {
        emit(LoginWithSocailLoading());
        if (loginBody != null) {
          log(loginBody.email);
          log(loginBody.username);
          log(loginBody.provider);
          log(loginBody.providerId);
          log(loginBody.photoUrl!);
          final result = await _loginWithSocailRepo.loginWithSocail(loginBody);
          result.fold(
            (failure) => emit(
              LoginWithSocailFailure('repo error : ${failure.errMessage}'),
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
