import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/theming/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorsManager.blue,
        ),
      ),
    );
  }
}
