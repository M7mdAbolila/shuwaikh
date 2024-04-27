
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/assets_path.dart';
import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class CartBroductItem extends StatelessWidget {
  const CartBroductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: 335.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: ColorsManager.lightBlue,
              offset: Offset(5, 5),
              blurRadius: 14,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.broduct),
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: isArabic()
                  ? EdgeInsets.only(right: 15.w)
                  : EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latte',
                    style: TextStyles.font24Black500Weight,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${S.of(context).price} ',
                          style: TextStyles.font16Black400Weight,
                        ),
                        TextSpan(
                          text: 'KD 100',
                          style: TextStyles.font18Blue500Weight,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorsManager.mainBlue,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      horizontalSpace(15),
                      Text(
                        '2',
                        style: TextStyles.font20Black500Weight,
                      ),
                      horizontalSpace(15),
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorsManager.mainBlue,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(60),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline,
                )),
          ],
        ),
      ),
    );
  }
}