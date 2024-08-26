import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../data/models/get_offers/get_offers_response.dart';

class OffersCarouelSlider extends StatefulWidget {
  const OffersCarouelSlider({
    super.key,
    required this.offers,
  });
  final List<Offer> offers;
  @override
  State<OffersCarouelSlider> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<OffersCarouelSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          controller: CarouselSliderController(),
          options: CarouselOptions(
            height: 200.h,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemCount: widget.offers.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return InkWell(
              onTap: () => context.pushNamed(
                Routes.offerScreen,
                arguments: widget.offers[index].id,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    '${ImagesPaths.offerPath}${widget.offers[index].image}',
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 260.w,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  );
                },
              ),
            );
          },
        ),
        verticalSpace(15),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.offers.length,
          effect: const SwapEffect(
            dotColor: AppColors.lightBlue,
            activeDotColor: AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
