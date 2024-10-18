import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.lableText,
  });
  final String lableText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: AppTextStyles.font16Gray400Weight,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
