import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_service.dart';
import '../../favourites/data/repos/get_favourite_repo.dart';
import '../../favourites/data/repos/is_favourite_repo.dart';
import '../../favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import '../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';
import 'widgets/products_body.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            IsFavouriteCubit(IsFavouriteRepo(ApiService(Dio()))),
      ),
      BlocProvider(
        create: (context) =>
            GetFavouriteCubit(GetFavouriteRepo(ApiService(Dio())))
              ..getFavourites(),
      ),
    ], child: const ProductsScreenBody());
  }
}
