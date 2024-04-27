import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../core/theming/styles.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 203.h,
              decoration: BoxDecoration(
                color: ColorsManager.darkBlue,
                borderRadius: isArabic()
                    ? const BorderRadius.only(bottomLeft: Radius.circular(80))
                    : const BorderRadius.only(bottomRight: Radius.circular(80)),
              ),
              child: Padding(
                padding: isArabic()
                    ? EdgeInsets.only(right: 20.w)
                    : EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Image.asset('assets/images/photo.png'),
                    horizontalSpace(14),
                    Text(
                      'Felix Dinh',
                      style: TextStyles.font26White500Weight,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(15),
            const Divider(),
            verticalSpace(20),
            Padding(
              padding: isArabic()
                  ? EdgeInsets.only(right: 26.w)
                  : EdgeInsets.only(left: 26.w),
              child: Column(
                children: [
                  DrawerItem(
                    iconPath: 'assets/icons/home_2.svg',
                    title: S.of(context).home,
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/transaction_history.svg',
                    title: S.of(context).trans_history,
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/account.svg',
                    title: S.of(context).account,
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/your_favourite.svg',
                    title: S.of(context).your_favorite,
                  ),
                  const Divider(),
                  DrawerItem(
                    iconPath: 'assets/icons/setting.svg',
                    title: S.of(context).setting,
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/logout.svg',
                    title: S.of(context).log_out,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
