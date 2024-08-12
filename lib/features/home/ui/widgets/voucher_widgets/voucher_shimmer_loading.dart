import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theming/colors.dart';

class VoucherShimmerLoading extends StatelessWidget {
  const VoucherShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Shimmer.fromColors(
            baseColor: AppColors.shimmerGrey,
            highlightColor: Colors.white,
            child: Container(
              width: 335.w,
              height: 105.h,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
        );
      },
    );
  }
}
