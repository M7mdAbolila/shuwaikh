import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/login/logic/login_with_social_cubit/login_with_socail_cubit.dart';
import 'package:shuwaikh/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:shuwaikh/features/login/ui/widgets/login_with_socail_bloc_listener.dart';
import 'package:shuwaikh/features/login/ui/widgets/social_login_button.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_auth_button.dart';
import '../../logic/login_cubit/login_cubit.dart';
import 'dont_have_account.dart';
import 'username_and_password.dart';
import '../../../../core/widgets/app_single_scffold.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarIcon: const Icon(Icons.arrow_back, color: Colors.white),
      appBarOnPressed: () => context.pop(),
      appBarTitle: S.of(context).login,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            verticalSpace(35),
            Text(
              S.of(context).lets_sign_in,
              style: AppTextStyles.font26Blue700Weight,
            ),
            Text(
              S.of(context).welcome_back,
              style: AppTextStyles.font16Black400Weight,
            ),
            verticalSpace(50),
            const UsernameAndPassword(),
            verticalSpace(55),
            AppAuthButton(
              text: S.of(context).sign_in,
              onTap: () {
                if (context
                    .read<LoginCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<LoginCubit>().emitLoginStates();
                }
              },
            ),
            verticalSpace(25),
            const DontHaveAccont(),
            verticalSpace(30),
            defaultTargetPlatform == TargetPlatform.iOS
                ? const SocialLoginButton(
                    text: 'Apple',
                    imagePath: Assets.apple,
                  )
                : const SizedBox.shrink(),
            verticalSpace(22),
            SocialLoginButton(
              text: 'Google',
              imagePath: Assets.google,
              onTap: () {
                context
                    .read<LoginWithSocailCubit>()
                    .loginWithSocail(provider: 'google');
              },
            ),
            verticalSpace(22),
            SocialLoginButton(
              text: 'FaceBook',
              imagePath: Assets.fackbook,
              onTap: () {
                context
                    .read<LoginWithSocailCubit>()
                    .loginWithSocail(provider: 'facebook');
              },
            ),
            const LoginBlocListener(),
            const LoginWithSocailBlocListener(),
            verticalSpace(150),
          ],
        ),
      ),
    );
  }
}
