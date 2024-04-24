import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.appBartitle, this.appBaricon, this.appBaronPressed});
  final String? appBartitle;
  final Icon? appBaricon;
  final VoidCallback? appBaronPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: appBaronPressed, icon: appBaricon ?? const SizedBox()),
        Text(
          appBartitle ?? '',
          style: TextStyles.font30White400Weight,
        ),
        horizontalSpace(1),
        const SizedBox(),
      ],
    );
  }
}
