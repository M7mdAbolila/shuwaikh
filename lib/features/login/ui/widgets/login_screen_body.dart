import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/login/ui/widgets/social_login_button.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../core/helpers/spacing.dart';
import 'dont_have_account.dart';
import 'email_and_password.dart';
import '../../../../core/widgets/app_single_scffold.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarIcon: const Icon(Icons.arrow_back, color: Colors.white),
      appBarTitle: S.of(context).login,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            verticalSpace(35),
            Text(
              S.of(context).lets_sign_in,
              style: TextStyles.font26Blue700Weight,
            ),
            Text(
              S.of(context).welcome_back,
              style: TextStyles.font16Black400Weight,
            ),
            verticalSpace(50),
            const EmailAndPassword(),
            verticalSpace(31),
            const DontHaveAccont(),
            verticalSpace(40),
            const SocialLoginButton(
              text: 'FaceBook',
              path: Assets.fackbook,
            ),
            verticalSpace(22),
            const SocialLoginButton(
              text: 'Google',
              path: Assets.google,
            ),
            verticalSpace(150),
          ],
        ),
      ),
    );
  }
}
