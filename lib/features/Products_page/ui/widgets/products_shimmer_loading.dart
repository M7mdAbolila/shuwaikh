import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';

class ProductsShimmerLoading extends StatelessWidget {
  const ProductsShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child: Container(
                  width: 335.w,
                  height: 115.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Shimmer.fromColors(
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
                  ),
                  horizontalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 20.h,
                          width: 140.w,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(10),
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 15.h,
                          width: 80.w,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(10),
                      Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 10.h,
                          width: 40.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
