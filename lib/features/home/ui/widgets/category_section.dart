import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/home/ui/widgets/broducts_list_view.dart';

class CategorySection extends StatelessWidget {
  const CategorySection(
      {super.key, required this.catogoryName, this.seeAllOnTap});
  final String catogoryName;
  final VoidCallback? seeAllOnTap;
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
        verticalSpace(25),
        const BroductsListView(),
      ],
    );
  }
}
