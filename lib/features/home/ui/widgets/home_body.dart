import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/home/ui/widgets/product_item.dart';
import 'package:shuwaikh/features/home/ui/widgets/combo_widget.dart';
import 'package:shuwaikh/features/home/ui/widgets/deal_item.dart';
import 'package:shuwaikh/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/helpers/assets_path.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import 'category_section.dart';
import 'voucher_section.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int activeIndex = 0;
  final images = [
    Image.asset(Assets.banner),
    Image.asset(Assets.banner),
    Image.asset(Assets.banner),
    Image.asset(Assets.banner),
    Image.asset(Assets.banner)
  ];
  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      isSubWidget: true,
      mainText1: S.of(context).welcome_to,
      mainText2: 'SHUWAIKH',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            // const BannerListView(),
            CarouselSlider.builder(
              carouselController: CarouselController(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return images[index];
              },
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: images.length,
              effect: const SwapEffect(
                dotColor: ColorsManager.lightBlue,
                activeDotColor: ColorsManager.darkBlue,
              ),
            ),
            verticalSpace(20),
            const CategorySection(
              catogoryName: 'New',
              item: ProductItem(),
              itemCount: 8,
            ),
            verticalSpace(15),
            const CategorySection(
              catogoryName: 'Hot deals',
              item: DealItem(),
              itemCount: 6,
            ),
            verticalSpace(30),
            const CategorySection(
              catogoryName: 'Combo',
              height: 120,
              item: ComboWidget(),
              itemCount: 5,
            ),
            verticalSpace(40),
            const VoucherSection(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
