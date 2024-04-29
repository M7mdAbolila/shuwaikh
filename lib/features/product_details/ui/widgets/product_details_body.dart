import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../generated/l10n.dart';
import 'product_nav_bar.dart';

class ProductDetailsScreenBody extends StatefulWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  State<ProductDetailsScreenBody> createState() =>
      _ProductDetailsScreenBodyState();
}

class _ProductDetailsScreenBodyState extends State<ProductDetailsScreenBody> {
  int activeIndex = 0;
  final images = [
    Image.asset(Assets.banner),
    Image.asset(Assets.banner),
    Image.asset(Assets.banner),
    Image.asset(Assets.banner),
    Image.asset(Assets.banner)
  ];
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorsManager.mainBlue,
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    verticalSpace(15),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: isArabic()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
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
                    verticalSpace(25),
                  ],
                )),
                SliverFillRemaining(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(35),
                            productInfo(context),
                            verticalSpace(15),
                            selectAddOns(context),
                            selectSize(context),
                            qunatity(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Align(alignment: Alignment.bottomCenter, child: ProductNavBar()),
      ],
    );
  }

  Column productInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latte',
          style: TextStyles.font24Black700Weight,
        ),
        verticalSpace(5),
        Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).price} ',
                    style: TextStyles.font16Black400Weight,
                  ),
                  TextSpan(
                    text: 'KD 100',
                    style: TextStyles.font18Blue500Weight,
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 18,
            ),
            Text(
              '4.5',
              style: TextStyles.font11Black500Weight,
            ),
          ],
        ),
        verticalSpace(10),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
          style: TextStyles.font13Black500Weight,
        ),
      ],
    );
  }

  Column selectAddOns(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_add_ons,
          style: TextStyles.font24Black500Weight,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor: ColorsManager.blue,
                onChanged: (check) {
                  setState(() {
                    isChecked = check;
                  });
                }),
            Text(
              S.of(context).ice,
              style: TextStyles.font16Gray400Weight,
            ),
            horizontalSpace(120),
            const Text('+ KD20'),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor: ColorsManager.blue,
                onChanged: (check) {
                  setState(() {
                    isChecked = check;
                  });
                }),
            Text(
              S.of(context).sugar,
              style: TextStyles.font16Gray400Weight,
            ),
            horizontalSpace(100),
            const Text('+ KD20'),
          ],
        ),
      ],
    );
  }

  Column selectSize(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_size,
          style: TextStyles.font24Black500Weight,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor: ColorsManager.blue,
                onChanged: (check) {
                  setState(() {
                    isChecked = check;
                  });
                }),
            Text(
              S.of(context).small,
              style: TextStyles.font16Gray400Weight,
            ),
            horizontalSpace(100),
            const Text('+ KD20'),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor: ColorsManager.blue,
                onChanged: (check) {
                  setState(() {
                    isChecked = check;
                  });
                }),
            Text(
              S.of(context).regular,
              style: TextStyles.font16Gray400Weight,
            ),
            horizontalSpace(85),
            const Text('+ KD20'),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor: ColorsManager.blue,
                onChanged: (check) {
                  setState(() {
                    isChecked = check;
                  });
                }),
            Text(
              S.of(context).large,
              style: TextStyles.font16Gray400Weight,
            ),
            horizontalSpace(100),
            const Text('+ KD20'),
          ],
        ),
      ],
    );
  }

  Row qunatity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).quantity,
          style: TextStyles.font20Black500Weight,
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: ColorsManager.lightBlue,
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
            ),
            horizontalSpace(15),
            Text(
              '2',
              style: TextStyles.font20Black500Weight,
            ),
            horizontalSpace(15),
            const CircleAvatar(
              radius: 12,
              backgroundColor: ColorsManager.mainBlue,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
