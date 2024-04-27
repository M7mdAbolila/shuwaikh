import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuwaikh/features/cart/ui/cart_screen.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/features/Products/ui/products_screen.dart';
import 'package:shuwaikh/features/home/ui/home_screen.dart';
import 'package:shuwaikh/features/vouncher/ui/voucher_screen.dart';
import '../../core/theming/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _index;
  late List<Widget> _screens;
  late PageController _pageController;

  @override
  void initState() {
    _index = 0;
    _pageController = PageController(initialPage: _index);
    _screens = [
      const HomeScreen(),
      const VoucherScreen(),
      const ProductsScreen(),
      const CartScreen(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          backgroundColor: Colors.transparent,
          index: _index,
          onTap: (index) => setState(() {
            _index = index;
            _pageController.jumpToPage(index);
          }),
          items: [
            SvgPicture.asset(Assets.homeIocn),
            SvgPicture.asset(Assets.ticketIcon),
            SvgPicture.asset(Assets.coffeeIcon),
            SvgPicture.asset(Assets.basketIcon),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
    );
  }
}
