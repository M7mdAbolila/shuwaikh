import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/Products_page/logic/products_page_cubit/products_page_cubit.dart';
import 'package:shuwaikh/features/home/ui/widgets/categories_widget/categories_shimmer_loading.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/categories_widget/category_item.dart';
import '../../logic/change_category_cubit/change_category_cubit.dart';
import '/core/helpers/globals.dart' as globals;

class ProductsCategoriesSection extends StatefulWidget {
  const ProductsCategoriesSection({super.key});

  @override
  State<ProductsCategoriesSection> createState() =>
      _ProductsCategoriesSectionState();
}

class _ProductsCategoriesSectionState extends State<ProductsCategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).all_categories,
          style: AppTextStyles.font24MainBlue500Weight,
        ),
        verticalSpace(10),
        const ProductsCategoriesListView(),
      ],
    );
  }
}

class ProductsCategoriesListView extends StatefulWidget {
  const ProductsCategoriesListView({
    super.key,
  });

  @override
  State<ProductsCategoriesListView> createState() =>
      _ProductsCategoriesListViewState();
}

class _ProductsCategoriesListViewState
    extends State<ProductsCategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsPageCubit, ProductsPageState>(
        builder: (context, state) {
      if (state is ProductsPageSuccess) {
        return SizedBox(
          height: 85.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.productsPageResponse.categories!.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                category: state.productsPageResponse.categories![index],
              );
            },
          ),
        );
      } else if (state is ProductsPageFailure) {
        return CustomErrMessageWidget(
          errMessage: state.errMessage,
        );
      } else {
        return const CategoriesShimmerLoading();
      }
    }, listener: (context, state) {
      if (state is ProductsPageSuccess) {
        context.read<ChangeCategoryCubit>().changeCategory(
              globals.currentCategoryId ??
                  state.productsPageResponse.categories![0].id!,
              globals.currentCategoryName ??
                  state.productsPageResponse.categories![0].name!,
            );
      }
    });
  }
}
