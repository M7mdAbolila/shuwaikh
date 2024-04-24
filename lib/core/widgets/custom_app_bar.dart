import 'package:flutter/material.dart';
import '../theming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.appBarOnPressed,
    this.appBarIcon,
    this.appBarTitle,
  });

  final VoidCallback? appBarOnPressed;
  final Widget? appBarIcon;
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: appBarOnPressed,
          child: appBarIcon ?? const SizedBox.shrink(),
        ),
        Text(
          appBarTitle ?? '',
          style: TextStyles.font30White400Weight,
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
