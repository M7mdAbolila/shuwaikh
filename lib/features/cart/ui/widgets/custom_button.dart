
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.textStyle,
  });
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: color ?? ColorsManager.mainBlue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle ?? TextStyles.font20White700Weight,
        ),
      ),
    );
  }
}

