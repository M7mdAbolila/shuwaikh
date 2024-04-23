import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.icon, this.onPressed});
  final String? title;
  final Icon? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: onPressed, icon: icon ?? const SizedBox()),
        Text(
          title ?? '',
          style: TextStyles.font30White400Weight,
        ),
        horizontalSpace(1),
        const SizedBox(),
      ],
    );
  }
}
