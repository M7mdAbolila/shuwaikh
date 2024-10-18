import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';
import 'package:shuwaikh/features/login/logic/login_with_social_cubit/login_with_socail_cubit.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/user_info_cachce.dart';
import '../../../../core/routing/routes.dart';

class LoginWithSocailBlocListener extends StatelessWidget {
  const LoginWithSocailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginWithSocailCubit, LoginWithSocailState>(
      listener: (context, state) async {
        if (state is LoginWithSocailLoading) {
          loadingDialog(context);
        } else if (state is LoginWithSocailSuccess) {
          final user = state.loginResponse.userData;
          await UserInfoCachceHelper.cacheUserInfo(
            username: user!.username,
            email: user.email,
            fname: user.fname,
            lname: user.lname,
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
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            state.loginResponse.token!,
          );
          context.pop();
          context.pushNamed(Routes.otp);
        } else if (state is LoginWithSocailFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
