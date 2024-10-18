import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';

import '../../../../generated/l10n.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.onTap,
    required this.text,
    required this.imagePath,
  });
  final VoidCallback? onTap;
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 315.w,
        height: 47.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightBlue,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              imagePath,
              height: 25.h,
              width: 25.w,
            ),
            Text(
              '${S.of(context).login_with} $text',
              style: AppTextStyles.font16Black400Weight,
            ),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
