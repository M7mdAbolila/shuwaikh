import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_widget.dart';

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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).your_offers,
          style: TextStyles.font24MainBlue500Weight,
          // TextStyles.font24MainBlue500Weight.copyWith(
          //   decoration: TextDecoration.underline,
          //   decorationColor: ColorsManager.mainBlue,
          // ),
        ),
        verticalSpace(15),
        BlocBuilder<GetOffersCubit, GetOffersState>(
          builder: (context, state) {
            if (state is GetOffersSuccess) {
              return Column(
                children: [
                  state.offers!.isEmpty
                      ? Center(
                          child: Text(
                            S.of(context).no_offers_found,
                            style: TextStyles.font30Red700Weight,
                          ),
                        )
                      : Column(
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
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return InkWell(
                                  onTap: () => context.pushNamed(
                                    Routes.offerScreen,
                                    arguments: state.offers![index].id,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${ImagesPaths.offerPath}${state.offers![index].image}',
                                  ),
                                );
                              },
                            ),
                            verticalSpace(8),
                            AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: state.offers!.length,
                              effect: const SwapEffect(
                                dotColor: ColorsManager.lightBlue,
                                activeDotColor: ColorsManager.darkBlue,
                              ),
                            ),
                          ],
                        ),
                ],
              );
            } else if (state is GetOffersFailure) {
              return CustomErrorWidget(
                errMessage: state.errMessage,
              );
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ],
    );
  }
}
