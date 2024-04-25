import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/theming/colors.dart';

import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          height: 60.h,
          color: ColorsManager.darkBlue,
          buttonBackgroundColor: ColorsManager.mainBlue,
          backgroundColor: Colors.transparent,
          index: index,
          onTap: (index) => setState(() => this.index = index),
          items: [
            SvgPicture.asset(Assets.homeIocn),
            SvgPicture.asset(Assets.ticketIcon),
            SvgPicture.asset(Assets.coffeeIcon),
            SvgPicture.asset(Assets.basketIcon),
          ],
        ),
      ),
      body: const HomeScreenBody(),
    );
  }
}
