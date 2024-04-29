import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.productDetailsScreen),
      child: Padding(
        padding: isArabic()
            ? const EdgeInsets.only(left: 8, right: 2, top: 4, bottom: 4)
            : const EdgeInsets.only(left: 2, right: 8, top: 4, bottom: 4),
        child: Container(
          height: 210.h,
          width: 130.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    Assets.broduct,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 5.h,
                    left: 100.w,
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: ColorsManager.mainBlue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ice coffee',
                      style: TextStyles.font13Black500Weight,
                    ),
                    verticalSpace(10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${S.of(context).price}  ',
                            style: TextStyles.font10Gray500Weight,
                          ),
                          TextSpan(
                            text: 'KD 100',
                            style: TextStyles.font14Blue400Weight,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(5),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
                        horizontalSpace(2),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        Text(
                          '4.5',
                          style: TextStyles.font11Black500Weight,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
