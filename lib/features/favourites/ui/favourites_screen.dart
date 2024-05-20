import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/favourites/data/repos/get_favourite_repo.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/product_details/data/repos/product_details_repo.dart';
import 'package:shuwaikh/features/product_details/logic/product_details_cubit/product_details_cubit.dart';

import '../data/repos/is_favourite_repo.dart';
import '../logic/is_favourite_cubit/is_favourite_cubit.dart';
import 'widgets/favourites_screen_body.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorsManager.blue,
        centerTitle: true,
        title: Text(
          'Your Favourites',
          style: TextStyles.font30White400Weight,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetFavouriteCubit(GetFavouriteRepo(ApiService(Dio())))
                  ..getFavourites(),
          ),
          BlocProvider(
            create: (context) =>
                ProductDetailsCubit(ProductDetailsRepo(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                IsFavouriteCubit(IsFavouriteRepo(ApiService(Dio()))),
          ),
        ],
        child: const FavouritesScreenBody(),
      ),
    );
  }
}
