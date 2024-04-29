import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/features/login/data/models/login_request_body.dart';
import 'package:shuwaikh/features/login/data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        username: usernameController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) {
      emit(
        LoginState.success(loginResponse),
      );
    }, failure: (error) {
      emit(
        LoginState.error(error: error.errMessage),
      );
    });
  }
}
