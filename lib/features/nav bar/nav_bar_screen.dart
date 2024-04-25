import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/features/home/ui/home_screen.dart';
import 'package:shuwaikh/features/login/ui/login_screen.dart';
import 'package:shuwaikh/features/sign_up/ui/sign_up_screen.dart';

import '../../core/helpers/assets_path.dart';
import '../../core/theming/colors.dart';

class NavBarSrceen extends StatefulWidget {
  const NavBarSrceen({super.key});

  @override
  State<NavBarSrceen> createState() => _NavBarSrceenState();
}

class _NavBarSrceenState extends State<NavBarSrceen> {
  int index = 0;
  final screens = [
    const HomeScreen(),
    const LoginScreen(),
    const SignupScreen(),
    const HomeScreen(),
  ];
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
      body: screens[index],
    );
  }
}
