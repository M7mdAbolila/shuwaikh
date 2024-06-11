import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';

import '../../logic/cubit/signup_cubit.dart';
import '../../logic/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            loadingDialog(context);
          },
          signupSuccess: (signupResponse) {
            context.pop();
            signupSuccessDialog(context);
          },
          signupError: (error) {
            errorDialog(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
