import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';

import '../../../../../core/theming/colors.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(right: 15.w),
                  height: 80.h,
                  width: 165.w,
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
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  Shimmer.fromColors(
                    baseColor: AppColors.shimmerGrey,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 20.h,
                      width: 65.w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
