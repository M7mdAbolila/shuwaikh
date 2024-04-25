
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';

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
              decoration: const BoxDecoration(
                color: ColorsManager.darkBlue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
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
              padding: EdgeInsets.only(left: 26.w),
              child: const Column(
                children: [
                  DrawerItem(
                    iconPath: 'assets/icons/home_2.svg',
                    title: 'Home',
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/transaction_history.svg',
                    title: 'Transaction history',
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/account.svg',
                    title: 'My Account',
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/your_favourite.svg',
                    title: 'Your Favourite',
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/setting.svg',
                    title: 'Setting',
                  ),
                  DrawerItem(
                    iconPath: 'assets/icons/logout.svg',
                    title: 'Log Out',
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
