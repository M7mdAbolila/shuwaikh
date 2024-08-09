
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/assets_path.dart';
import '../../../../../core/theming/colors.dart';

class VoucherShimmerLoading extends StatelessWidget {
  const VoucherShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: Colors.white,
      child: Image.asset(
        width: 335.w,
        height: 105.h,
        Assets.voucher,
        fit: BoxFit.fill,
      ),
    );
  }
}
