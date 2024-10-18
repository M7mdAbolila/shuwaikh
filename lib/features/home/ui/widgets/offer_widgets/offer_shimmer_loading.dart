import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theming/colors.dart';

class OfferShimmerLoading extends StatelessWidget {
  const OfferShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: Colors.white,
      child: Container(
        height: 195.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
