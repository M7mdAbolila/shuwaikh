import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.iconPath, required this.title, this.onTap});
  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 70.h,
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
            horizontalSpace(15),
            Text(
              title,
              style: AppTextStyles.font20Black500Weight,
            ),
          ],
        ),
      ),
    );
  }
}
