import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shuwaikh/core/di/dependency_injection.dart';

import 'package:shuwaikh/features/home/logic/get_categories_cubit/get_categories_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_coupons_cubit/get_coupons_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCategoriesCubit>()
            ..getCategories(Intl.getCurrentLocale()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetOffersCubit>()..getOffers(Intl.getCurrentLocale()),
        ),
        BlocProvider(
          create: (context) => getIt<GetCouponsCubit>()..getCoupons(),
        ),
      ],
      child: const HomeScreenBody(),
    );
  }
}
