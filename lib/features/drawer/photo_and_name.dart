
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/is_arabic.dart';
import '../../core/helpers/spacing.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';

class PhotoAndName extends StatelessWidget {
  const PhotoAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: isArabic()
            ? const BorderRadius.only(bottomLeft: Radius.circular(80))
            : const BorderRadius.only(bottomRight: Radius.circular(80)),
      ),
      child: Padding(
        padding: isArabic()
            ? EdgeInsets.only(right: 20.w)
            : EdgeInsets.only(left: 20.w),
        child: Row(
          children: [
            Image.asset('assets/images/photo.png'),
            horizontalSpace(14),
            Text(
              'Felix Dinh',
              style: TextStyles.font26White500Weight,
            ),
          ],
        ),
      ),
    );
  }
}
