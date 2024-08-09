import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../generated/l10n.dart';

class NoOffersFound extends StatelessWidget {
  const NoOffersFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: CustomErrMessageWidget(
        errMessage: S.of(context).no_offers_found,
      ),
    );
  }
}
