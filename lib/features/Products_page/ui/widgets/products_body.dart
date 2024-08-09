import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/Products_page/logic/cubit/reload_favourites_cubit.dart';
import 'package:shuwaikh/features/Products_page/ui/widgets/products_categories_section.dart';
import 'package:shuwaikh/features/Products_page/ui/widgets/products_section.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '/core/helpers/globals.dart' as globals;

import '../../../localization/cubit/locale_cubit.dart';
import '../../logic/products_page_cubit/products_page_cubit.dart';

class ProductsScreenBody extends StatefulWidget {
  const ProductsScreenBody({super.key});

  @override
  State<ProductsScreenBody> createState() => _ProductsScreenBodyState();
}

class _ProductsScreenBodyState extends State<ProductsScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetFavouriteCubit>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      isSubWidget: true,
      mainText1: S.of(context).its_great_day_for,
      mainText2: S.of(context).coffee,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            const ProductsCategoriesSection(),
            verticalSpace(20),
            const ProuductsSection(),
            BlocListener<LocaleCubit, ChangeLocaleState>(
              listener: (context, state) {
                setState(() {
                  context
                      .read<ProductsPageCubit>()
                      .emitProductsPageStates(state.locale.languageCode);
                  globals.currentCategoryId = null;
                  globals.currentCategoryName = null;
                });
              },
              child: const SizedBox.shrink(),
            ),
            BlocListener<ReloadFavouritesCubit, ReloadFavouritesState>(
              listener: (context, state) {
                setState(() {
                  context
                      .read<ProductsPageCubit>()
                      .emitProductsPageStates(Intl.getCurrentLocale());
                });
              },
              child: const SizedBox.shrink(),
            ),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
