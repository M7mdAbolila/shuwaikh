import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';


class ProductDetailsShimmerLoading extends StatelessWidget {
  const ProductDetailsShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            verticalSpace(80),
            Shimmer.fromColors(
              baseColor: AppColors.shimmerGrey,
              highlightColor: Colors.white,
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
            ),
            verticalSpace(50),
            Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 500.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(30),
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 40.h,
                          width: 250.w,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(15),
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 25.h,
                          width: 150.w,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(15),
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 250.h,
                          width: 300.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
