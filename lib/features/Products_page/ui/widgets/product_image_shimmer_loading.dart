
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';

class ProductImageShimmerLoading extends StatelessWidget {
  const ProductImageShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: Colors.white,
      child: Container(
        width: 110.w,
        height: 110.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
      ),
    );
  }
}