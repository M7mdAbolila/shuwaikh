import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/di/dependency_injection.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/product_details/logic/product_details_cubit/product_details_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../logic/is_favourite_cubit/is_favourite_cubit.dart';
import 'widgets/favourites_screen_body.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.blue,
        centerTitle: true,
        title: Text(
          S.of(context).your_favorite,
          style: AppTextStyles.font30White400Weight,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetFavouriteCubit>()..getFavourites(),
          ),
          BlocProvider(
            create: (context) => getIt<ProductDetailsCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<IsFavouriteCubit>(),
          ),
        ],
        child: const FavouritesScreenBody(),
      ),
    );
  }
}
