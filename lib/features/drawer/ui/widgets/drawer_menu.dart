import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/drawer/ui/widgets/bloc_listener_logout.dart';
import 'package:shuwaikh/features/drawer/ui/widgets/drawer_item.dart';
import 'package:shuwaikh/features/logout/logic/cubit/logout_cubit.dart';

import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/cubit/change_page_cubit.dart';

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
            onTap: () {
              context.read<ChangePageCubit>().changePage(0);
              context.pushNamed(Routes.mainScreen);
            },
          ),
          DrawerItem(
            iconPath: 'assets/icons/basket_icon.svg',
            title: S.of(context).my_orders,
            onTap: () => context.pushNamed(Routes.myOrdersScreen),
          ),
          DrawerItem(
            iconPath: 'assets/icons/account.svg',
            title: S.of(context).account,
            onTap: () => context.pushNamed(Routes.account),
          ),
          DrawerItem(
            iconPath: 'assets/icons/your_favourite.svg',
            title: S.of(context).your_favorite,
            onTap: () => context.pushNamed(Routes.favourites),
          ),
          const Divider(),
          DrawerItem(
            iconPath: 'assets/icons/setting.svg',
            title: S.of(context).setting,
            onTap: () => context.pushNamed(Routes.setting),
          ),
          DrawerItem(
            iconPath: 'assets/icons/logout.svg',
            title: S.of(context).log_out,
            onTap: () => context.read<LogoutCubit>().logout(),
          ),
          const BlocListenerLogout(),
          const Divider(),
        ],
      ),
    );
  }
}
