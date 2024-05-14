import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/home/logic/get_categories_cubit/get_categories_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_coupons_cubit/get_coupons_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import 'package:shuwaikh/features/home/ui/widgets/offers_section.dart';
import 'package:shuwaikh/features/localization/cubit/locale_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../core/helpers/spacing.dart';
import 'category_section.dart';
import 'voucher_section.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
            const OffersSection(),
            verticalSpace(20),
            const CategoriesSection(),
            verticalSpace(20),
            const VoucherSection(),
            verticalSpace(20),
            BlocListener<LocaleCubit, ChangeLocaleState>(
              listener: (context, state) {
                setState(() {
                  context.read<GetOffersCubit>().getOffers();
                  context.read<GetCategoriesCubit>().getCategories();
                  context.read<GetCouponsCubit>().getCoupons();
                });
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
