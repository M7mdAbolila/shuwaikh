import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/features/login/data/models/login_request_body.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';
import 'package:shuwaikh/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginStates() async {
    emit(LoginLoading());
    final result = await _loginRepo.login(
      LoginRequestBody(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (loginResponse) => emit(
        LoginSuccess(loginResponse),
      ),
    );
    // response.when(success: (LoginResponse loginResponse) {
    //   emit(
    //     LoginState.success(loginResponse),
    //   );
    // }, failure: (error) {
    //   emit(
    //     LoginState.error(error: error.errMessage),
    //   );
    // });
  }
}
