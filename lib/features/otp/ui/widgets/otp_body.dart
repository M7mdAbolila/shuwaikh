import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shuwaikh/core/widgets/app_single_scffold.dart';
import 'package:shuwaikh/generated/l10n.dart';

import 'dont_recive_code.dart';

// ignore: must_be_immutable
class OtpScreenBody extends StatelessWidget {
  OtpScreenBody({super.key});
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: S.of(context).confirm_otp,
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
              S.of(context).enter_otp,
              style: TextStyles.font26Blue700Weight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(110),
            PinCodeTextField(
              appContext: context,
              autoFocus: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              length: 4,
              obscureText: false,
              animationType: AnimationType.scale,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 64,
                fieldWidth: 64,
                borderWidth: 0.5,
                activeColor: ColorsManager.blue,
                inactiveColor: ColorsManager.grey,
                inactiveFillColor: Colors.white,
                activeFillColor: ColorsManager.lightBlue,
                selectedColor: ColorsManager.blue,
                selectedFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              onCompleted: (submitedCode) {
                otpCode = submitedCode;
              },
            ),
            verticalSpace(50),
            const DontReciveCode(),
            verticalSpace(50),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(Routes.mainScreen);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(331.w, 50.h),
                backgroundColor: ColorsManager.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                S.of(context).verify,
                style: TextStyles.font26White500Weight,
              ),
            ),
            verticalSpace(300),
          ],
        ),
      ),
    );
  }
}
