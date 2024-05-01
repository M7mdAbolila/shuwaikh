

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Center(
        child: Text(
          errMessage,
          style: TextStyles.font20Red600Weight,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
