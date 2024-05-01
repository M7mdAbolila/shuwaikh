import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const OffersListView();
  }
}

class OffersListView extends StatefulWidget {
  const OffersListView({
    super.key,
  });
  @override
  State<OffersListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<OffersListView> {
  int activeIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<GetOffersCubit>().getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        if (state is GetOffersSuccess) {
          return Column(
            children: [
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
                itemCount: state.offers!.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return CachedNetworkImage(
                    imageUrl:
                        'https://shuwaikhcoffee.com/assets/front/img/offer/featured/${state.offers![index].image}',
                  );
                },
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: state.offers!.length,
                effect: const SwapEffect(
                  dotColor: ColorsManager.lightBlue,
                  activeDotColor: ColorsManager.darkBlue,
                ),
              ),
            ],
          );
        } else if (state is GetOffersFailure) {
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
