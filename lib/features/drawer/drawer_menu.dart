import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/drawer/drawer_item.dart';

import '../../core/helpers/is_arabic.dart';
import '../../core/routing/routes.dart';
import '../../generated/l10n.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isArabic()
          ? EdgeInsets.only(right: 26.w)
          : EdgeInsets.only(left: 26.w),
      child: Column(
        children: [
          DrawerItem(
            iconPath: 'assets/icons/home_2.svg',
            title: S.of(context).home,
            onTap: () => context.pushNamed(Routes.mainScreen),
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
    );
  }
}
