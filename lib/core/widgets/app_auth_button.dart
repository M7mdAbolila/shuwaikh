import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppAuthButton extends StatelessWidget {
  const AppAuthButton({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyles.font30Black400Weight,
        ),
        GestureDetector(
          onTap:onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.blue,
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
