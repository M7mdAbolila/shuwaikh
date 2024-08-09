import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/home/ui/widgets/categories_widget/categories_shimmer_loading.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../logic/get_categories_cubit/get_categories_cubit.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

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
          return CustomErrMessageWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CategoriesShimmerLoading();
        }
      },
    );
  }
}
