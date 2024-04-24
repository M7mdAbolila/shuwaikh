
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/home/ui/widgets/vouncher_item.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class VoucherSection extends StatelessWidget {
  const VoucherSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Voucher',
              style: TextStyles.font24MainBlue500Weight.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.mainBlue,
              ),
            ),
            InkWell(
              onTap: () {},
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
        verticalSpace(18),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return const VoucherItem();
          },
        ),
      ],
    );
  }
}
