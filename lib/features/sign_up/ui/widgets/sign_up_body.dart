import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/sign_up/ui/widgets/have_account_text.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_background.dart';
import 'sign_up_form.dart';

class SignupScreenBody extends StatelessWidget {
  const SignupScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      appBarTitle: 'Register',
      appBarIcon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      appBarOnPressed: () => context.pop(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            verticalSpace(35),
            Text(
              'Great to see you here!',
              style: TextStyles.font26Blue700Weight,
            ),
            SizedBox(
              width: 220.w,
              child: Text(
                'Let’s set up your account in just a couple of steps.',
                style: TextStyles.font16Black400Weight,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(30),
            const SignupForm(),
            verticalSpace(40),
            const HaveAnAccountText(),
          ],
        ),
      ),
    );
  }
}
