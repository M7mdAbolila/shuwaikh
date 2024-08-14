import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuwaikh/features/cart/ui/cart_screen.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/features/Products_page/ui/products_screen.dart';
import 'package:shuwaikh/features/drawer/ui/drawer_screen.dart';
import 'package:shuwaikh/features/home/ui/home_screen.dart';
import 'package:shuwaikh/features/nav_bar/cubit/change_page_cubit.dart';
import 'package:shuwaikh/features/vouncher/ui/voucher_screen.dart';
import '../../core/theming/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> _screens;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    context.read<ChangePageCubit>().getPage();
    pageController = PageController(initialPage: 0);

    _screens = [
      const HomeScreen(),
      const VoucherScreen(),
      const ProductsScreen(),
      const CartScreen(),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentPage;
    return PopScope(
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: BlocConsumer<ChangePageCubit, ChangePageState>(
        builder: (context, state) {
          currentPage = state.currentPage;
          return Scaffold(
            drawer: const CustomDrawer(),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(
                height: 60.h,
                color: AppColors.darkBlue,
                backgroundColor: Colors.transparent,
                index: currentPage,
                onTap: (index) => setState(() {
                  currentPage = index;
                  context.read<ChangePageCubit>().changePage(index);

                  // pageController.jumpToPage(index);
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
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _screens,
            ),
          );
        },
        listener: (context, state) {
          setState(() {
            pageController.jumpToPage(state.currentPage);
            // context.read<ChangePageCubit>().changePage(state.currentPage);
          });
        },
      ),
    );
  }
}
