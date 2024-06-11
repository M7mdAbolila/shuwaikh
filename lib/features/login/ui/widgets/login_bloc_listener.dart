import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';

import '../../../../core/helpers/setup_dialogs.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          loadingDialog(context);
        } else if (state is LoginSuccess) {
          final user = state.loginResponse.userData;
          context.pop();
          await UserInfoCachceHelper.cacheUserInfo(
            token: state.loginResponse.token,
            username: user!.username,
            email: user.email,
            number: user.number,
            photo: user.photo,
            shAddress: user.shippingAddress,
            shCity: user.shippingCity,
            shEmail: user.shippingEmail,
            shFname: user.shippingFname,
            shLname: user.shippingLname,
            shNumber: user.shippingNumber,
            billAddress: user.address,
            billCity: user.billingCity,
            billEmail: user.billingEmail,
            billFname: user.billingFname,
            billLname: user.billingLname,
            billNumber: user.billingNumber,
          );
          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setBool('isLogin', true);
          context.pushNamed(Routes.otp);
        } else if (state is LoginFailure) {
          errorDialog(context, state.errMessage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  
}
