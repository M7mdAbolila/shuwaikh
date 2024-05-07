import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/localization/cubit/locale_cubit.dart';
import '../../core/helpers/spacing.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});
  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.logo),
              verticalSpace(40),
              Text(
                'Select Your Language',
                style: TextStyles.font20Black500Weight,
              ),
              verticalSpace(20),
              OnboradingButton(
                text: 'English',
                onPressed: () {
                  context.read<LocaleCubit>().changeLanguage('en');
                  context.pushNamed(Routes.loginScreen);
                },
              ),
              verticalSpace(30),
              OnboradingButton(
                text: 'عربي',
                onPressed: () {
                  context.read<LocaleCubit>().changeLanguage('ar');
                  context.pushNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboradingButton extends StatelessWidget {
  const OnboradingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(331.w, 50.h),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.font26White500Weight,
      ),
    );
  }
}
