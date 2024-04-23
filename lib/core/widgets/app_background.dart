import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.body, this.appBarTitle, this.appBarIcon, this.appBarOnPressed,
  });
  final Widget body;
  final String? appBarTitle;
  final Icon? appBarIcon;
  final VoidCallback? appBarOnPressed;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: appBarOnPressed,
                      icon: appBarIcon ?? const SizedBox(),
                    ),
                    Text(
                      appBarTitle ?? '',
                      style: TextStyles.font30White400Weight,
                    ),
                    horizontalSpace(1),
                    const SizedBox(),
                  ],
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
