import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/widgets/app_background.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isHome: true,
      appBarIcon: SvgPicture.asset(Assets.menuIcon),
      isSubWidget: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
