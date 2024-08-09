// ignore_for_file: use_build_context_synchronously
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/home/data/models/get_coupons/get_coupons_response.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../../../core/helpers/assets_path.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key, required this.coupon});
  final Coupon coupon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Stack(
        children: [
          Image.asset(
            width: 335.w,
            height: 105.h,
            Assets.voucher,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 10.h,
            left: 8.w,
            child: Container(
              height: 21.h,
              width: 81.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: Text(
                  coupon.name ?? getFail,
                  style: AppTextStyles.font13White500Weight,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Positioned(
            top: 42.h,
            left: 13.w,
            child: coupon.type == 'percentage'
                ? Text(
                    '%${coupon.value ?? getFail}',
                    style: AppTextStyles.font24MainBlue500Weight,
                  )
                : Text(
                    'KD${coupon.value ?? getFail}',
                    style: AppTextStyles.font20MainBlue500Weight,
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
                style: AppTextStyles.font13Black500Weight,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: isArabic() ? TextAlign.right : TextAlign.left,
              ),
            ),
          ),
          Positioned(
            top: 64.h,
            left: 240.w,
            child: InkWell(
              onTap: () => showCouponDialog(context),
              child: Container(
                height: 30.h,
                width: 85.w,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    S.of(context).apply,
                    style: AppTextStyles.font14LightBlue500weight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 86.h,
            left: 116.w,
            child: Text(
              '${S.of(context).expired}: ${coupon.endDate}',
              style: AppTextStyles.font10DrakBlue400Weight,
            ),
          ),
        ],
      ),
    );
  }

  void showCouponDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(coupon.name!),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      Assets.voucher,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      coupon.code!,
                      style: AppTextStyles.font26Blue700Weight,
                    ),
                  ],
                ),
                verticalSpace(5),
                Text(
                  coupon.type == 'percentage'
                      ? '%${coupon.value} ${S.of(context).minimum_discount} KD${coupon.minimumSpend}'
                      : 'KD${coupon.value} ${S.of(context).minimum_discount} KD${coupon.minimumSpend}',
                  style: AppTextStyles.font13Black500Weight,
                  textAlign: isArabic() ? TextAlign.right : TextAlign.left,
                ),
                verticalSpace(5),
                Text(
                  S.of(context).copy_and_paste,
                  style: AppTextStyles.font18Blue500Weight,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pop();
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () async {
                await FlutterClipboard.copy(coupon.code!);
                customSnackBar(context, S.of(context).copied, false);
                context.pop();
              },
              child: Text(S.of(context).copy),
            ),
          ],
        );
      },
    );
  }
}
