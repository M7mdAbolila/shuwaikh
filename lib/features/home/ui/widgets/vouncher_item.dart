import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/features/home/data/models/get_coupons/get_coupons_response.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../../core/helpers/assets_path.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key, required this.coupon});
  final Coupon coupon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        children: [
          Image.asset(
            Assets.voucher,
            width: 335.w,
            height: 104.h,
          ),
          Positioned(
            top: 10.h,
            left: 8.w,
            child: Container(
              height: 21.h,
              width: 81.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: ColorsManager.mainBlue,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: Text(
                  coupon.name ?? '',
                  style: TextStyles.font13White500Weight,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Positioned(
            top: 42.h,
            left: 15.w,
            child: coupon.type == 'percentage'
                ? Text(
                    '%${coupon.value ?? ''}',
                    style: TextStyles.font24MainBlue500Weight,
                  )
                : Text(
                    'KD${coupon.value ?? ''}',
                    style: TextStyles.font20MainBlue500Weight,
                  ),
          ),
          Positioned(
            top: 10.h,
            left: 118.w,
            child: SizedBox(
              height: 40.h,
              width: 183.w,
              child: Text(
                coupon.type == 'percentage'
                    ? '%${coupon.value} ${S.of(context).minimum_discount} KD${coupon.minimumSpend}'
                    : 'KD${coupon.value} ${S.of(context).minimum_discount} KD${coupon.minimumSpend}',
                style: TextStyles.font13Black500Weight,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: isArabic() ? TextAlign.right : TextAlign.left,
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
              '${S.of(context).expired}: ${coupon.endDate}',
              style: TextStyles.font10DrakBlue400Weight,
            ),
          ),
        ],
      ),
    );
  }
}
