import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/widgets/app_single_scffold.dart';
import 'package:shuwaikh/features/sign_up/ui/widgets/have_account_text.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import 'sign_up_form.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: S.of(context).register,
      appBarIcon: const Icon(Icons.arrow_back, color: Colors.white),
      appBarOnPressed: () => context.pop(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            verticalSpace(35),
            Text(
              S.of(context).Great_to_see_you,
              style: TextStyles.font26Blue700Weight,
            ),
            SizedBox(
              width: 220.w,
              child: Text(
                S.of(context).lets_setup_account,
                style: TextStyles.font16Black400Weight,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpace(30),
            const SignupForm(),
            verticalSpace(40),
            const HaveAnAccountText(),
            verticalSpace(200),
          ],
        ),
      ),
    );
  }
}
