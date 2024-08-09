
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/assets_path.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../generated/l10n.dart';

class NoCouponsFound extends StatelessWidget {
  const NoCouponsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          width: 335.w,
          height: 105.h,
          Assets.voucher,
          fit: BoxFit.fill,
        ),
        CustomErrMessageWidget(
          errMessage: S.of(context).no_coupons,
        ),
      ],
    );
  }
}
