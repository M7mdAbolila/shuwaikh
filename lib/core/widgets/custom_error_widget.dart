import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class CustomErrMessageWidget extends StatelessWidget {
  const CustomErrMessageWidget({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 130.h,
        child: Center(
          child: Text(
            errMessage,
            style: AppTextStyles.font20Red600Weight,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
