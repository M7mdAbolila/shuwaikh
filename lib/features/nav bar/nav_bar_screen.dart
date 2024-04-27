import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/helpers/assets_path.dart';
import '../../core/theming/colors.dart';

// ignore: must_be_immutable
class CustomNavBar extends StatefulWidget {
   CustomNavBar({super.key, this.index = 0});
   int index;
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      child: CurvedNavigationBar(
        height: 60.h,
        color: ColorsManager.darkBlue,
        buttonBackgroundColor: ColorsManager.mainBlue,
        backgroundColor: Colors.transparent,
        index: widget.index,
        onTap: (index) => setState(() => widget.index = index),
        items: [
          SvgPicture.asset(Assets.homeIocn),
          SvgPicture.asset(Assets.ticketIcon),
          SvgPicture.asset(Assets.coffeeIcon),
          SvgPicture.asset(Assets.basketIcon),
        ],
      ),
    );
  }
}
