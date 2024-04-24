import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.catogoryName,
    this.seeAllOnTap,
    required this.item,
    this.height, required this.itemCount,
  });
  final String catogoryName;
  final Widget item;
  final VoidCallback? seeAllOnTap;
  final double? height;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              catogoryName,
              style: TextStyles.font24MainBlue500Weight.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.mainBlue,
              ),
            ),
            InkWell(
              onTap: seeAllOnTap,
              child: Container(
                height: 28.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: ColorsManager.mainBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'See all',
                    style: TextStyles.font13White500Weight,
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(15),
        SizedBox(
          height: height?.h ?? 220.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return item;
            },
          ),
        ),
      ],
    );
  }
}
