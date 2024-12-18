
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/assets_path.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        children: [
          Image.asset(Assets.voucher),
          Positioned(
            top: 10.h,
            left: 8.w,
            child: Container(
              height: 21.h,
              width: 81.w,
              decoration: BoxDecoration(
                color: ColorsManager.mainBlue,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: Text(
                  'DELIVERY',
                  style: TextStyles.font13White500Weight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 42.h,
            left: 31.w,
            child: Text(
              '\$5',
              style: TextStyles.font30MainBlue500Weight,
            ),
          ),
          Positioned(
            top: 10.h,
            left: 118.w,
            child: SizedBox(
              height: 40.h,
              width: 183.w,
              child: Text(
                '\$5 minimum discount for orders over \$10 ',
                style: TextStyles.font16Black500Weight,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            top: 64.h,
            left: 240.w,
            child: Container(
              height: 30.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: ColorsManager.darkBlue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'Apply now',
                  style: TextStyles.font14LightBlue500weight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 86.h,
            left: 116.w,
            child: Text(
              'expired: 10/1/2021',
              style: TextStyles.font10DrakBlue400Weight,
            ),
          ),
        ],
      ),
    );
  }
}
