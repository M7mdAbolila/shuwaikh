import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import 'custom_app_bar.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsManager.mainBlue,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                verticalSpace(50),
                const CustomAppBar(
                  title: 'Login',
                ),
                verticalSpace(45),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
