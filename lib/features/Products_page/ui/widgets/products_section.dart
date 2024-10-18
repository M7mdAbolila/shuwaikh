import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/features/Products_page/logic/change_category_cubit/change_category_cubit.dart';
import 'package:shuwaikh/features/Products_page/logic/products_page_cubit/products_page_cubit.dart';
import 'package:shuwaikh/features/favourites/data/models/get_favourites/get_favourites_response.dart';

import '../../../../core/theming/styles.dart';
import '../../../favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'horizontal_product_item.dart';
import 'products_shimmer_loading.dart';

class ProuductsSection extends StatefulWidget {
  const ProuductsSection({
    super.key,
  });

  @override
  State<ProuductsSection> createState() => _ProuductsSectionState();
}

class _ProuductsSectionState extends State<ProuductsSection> {
  List<FavouriteProduct> favourites = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCategoryCubit, ChangeCategoryState>(
      builder: (context, changeCategoryState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<GetFavouriteCubit, GetFavouriteState>(
              listener: (context, state) {
                if (state is GetFavouriteSuccess) {
                  favourites = state.favourites!;
                }
              },
              child: const SizedBox.shrink(),
            ),
            Text(
              changeCategoryState.name ?? '',
              style: AppTextStyles.font20Black500Weight,
            ),
            verticalSpace(10),
            BlocBuilder<ProductsPageCubit, ProductsPageState>(
              builder: (context, state) {
                if (state is ProductsPageSuccess) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.productsPageResponse.products!.length,
                    itemBuilder: (context, index) {
                      bool hasProduct = favourites.any(
                        (element) =>
                            element.productId ==
                            state.productsPageResponse.products![index].id,
                      );

                      return hasProduct &&
                              state.productsPageResponse.products![index]
                                      .categoryId ==
                                  changeCategoryState.id
                          ? HorizontalProductItem(
                              product:
                                  state.productsPageResponse.products![index],
                              isFavourite: true,
                            )
                          : state.productsPageResponse.products![index]
                                      .categoryId ==
                                  changeCategoryState.id
                              ? HorizontalProductItem(
                                  product: state
                                      .productsPageResponse.products![index],
                                  isFavourite: false,
                                )
                              : const SizedBox.shrink();
                    },
                  );
                } else if (state is ProductsPageFailure) {
                  return CustomErrMessageWidget(errMessage: state.errMessage);
                } else {
                  return const ProductsShimmerLoading();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
