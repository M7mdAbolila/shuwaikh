import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.blue,
              ),
            ),
          );
        } else if (state is LoginSuccess) {
          final user = state.loginResponse.userData;
          context.pop();
          context.pushNamed(Routes.otp);
          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setBool('isLogin', true);
          UserInfoCachceHelper.cacheUserInfo(
            token: state.loginResponse.token,
            username: user!.username,
            email: user.email,
            number: user.number,
            shAddress: user.shppingAddress,
            shCity: user.shppingCity,
            shEmail: user.shppingEmail,
            shFname: user.shppingFname,
            shLname: user.shppingLname,
            shNumber: user.shppingNumber,
            billAddress: user.address,
            billCity: user.billingCity,
            billEmail: user.billingEmail,
            billFname: user.billingFname,
            billLname: user.billingLname,
            billNumber: user.billingNumber,
          );
        } else if (state is LoginFailure) {
          setupErrorState(context, state.errMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font16Blue400Weight,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14Black400Weight,
            ),
          ),
        ],
      ),
    );
  }
}
