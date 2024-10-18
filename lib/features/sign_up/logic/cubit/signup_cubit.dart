import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shuwaikh/features/sign_up/data/repos/sign_up_repo.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text,
          number: phoneController.text),
    );
    response.when(success: (signupRespose) {
      emit(
        SignupState.signupSuccess(signupRespose),
      );
    }, failure: (error) {
      emit(
        SignupState.signupError(error: error.errMessage),
      );
    });
  }
}
