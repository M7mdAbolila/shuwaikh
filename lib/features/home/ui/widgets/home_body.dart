import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/home/ui/widgets/category_item.dart';
import 'package:shuwaikh/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/helpers/assets_path.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/cubit/get_categories_cubit.dart';
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
            const CategoriesSection(),
            verticalSpace(40),
            const VoucherSection(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).all_categories,
          style: TextStyles.font24MainBlue500Weight.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.mainBlue,
          ),
        ),
        const CategoriesListView(),
      ],
    );
  }
}

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  void initState() {
    super.initState();
    context.read<GetCategoriesCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          return SizedBox(
            height: 85.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories!.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: state.categories![index],
                );
              },
            ),
          );
        } else if (state is GetCategoriesFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: TextStyles.font13Black500Weight,
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
