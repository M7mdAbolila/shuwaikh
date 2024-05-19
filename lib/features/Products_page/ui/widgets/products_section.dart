import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/Products_page/logic/cubit/change_category_cubit.dart';
import 'package:shuwaikh/features/Products_page/logic/products_page_cubit/products_page_cubit.dart';

import '../../../../core/theming/styles.dart';
import 'horizontal_product_item.dart';

class ProuductsSection extends StatefulWidget {
  const ProuductsSection({
    super.key,
  });

  @override
  State<ProuductsSection> createState() => _ProuductsSectionState();
}

class _ProuductsSectionState extends State<ProuductsSection> {
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCategoryCubit, ChangeCategoryState>(
      builder: (context, changeCategoryState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              changeCategoryState.name ?? getFail,
              style: TextStyles.font20Black500Weight,
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
                      return state.productsPageResponse.products![index]
                                  .categoryId ==
                              changeCategoryState.id
                          ? HorizontalProductItem(
                              product:
                                  state.productsPageResponse.products![index],
                            )
                          : const SizedBox.shrink();
                    },
                  );
                } else if (state is ProductsPageFailure) {
                  return CustomErrorWidget(errMessage: state.errMessage);
                } else {
                  return const CustomLoadingWidget();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
