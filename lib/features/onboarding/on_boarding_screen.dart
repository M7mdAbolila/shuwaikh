import 'package:flutter/material.dart';
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
    return Scaffold(
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
            ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('en');
                context.pushNamed(Routes.loginScreen);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(331.w, 50.h),
                backgroundColor: ColorsManager.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'English',
                style: TextStyles.font26White500Weight,
              ),
            ),
            verticalSpace(30),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('ar');
                context.pushNamed(Routes.loginScreen);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(331.w, 50.h),
                backgroundColor: ColorsManager.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'عربي',
                style: TextStyles.font26White500Weight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
