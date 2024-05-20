import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';
import 'custom_app_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBarTitle,
    this.appBarIcon,
    this.appBarOnPressed,
  });
  final Widget body;
  final String? appBarTitle;
  final Widget? appBarIcon;
  final VoidCallback? appBarOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.blue,
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  verticalSpace(15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: CustomAppBar(
                      appBarIcon: appBarIcon,
                      appBarOnPressed: appBarOnPressed,
                      appBarTitle: appBarTitle,
                    ),
                  ),
                  verticalSpace(45),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: body,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
