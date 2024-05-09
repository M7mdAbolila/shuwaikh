import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ProductNavBar extends StatelessWidget {
  const ProductNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.darkBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).total}: ',
                    style: TextStyles.font13White500Weight,
                  ),
                  TextSpan(
                    text: 'KD100',
                    style: TextStyles.font20White700Weight,
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsManager.lightBlue,
              ),
              child: Center(
                child: Text(
                  S.of(context).add_to_cart,
                  style: TextStyles.font14Blue400Weight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
