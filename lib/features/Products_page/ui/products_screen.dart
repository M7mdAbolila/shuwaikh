import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/networking/api_service.dart';
import '../../favourites/data/repos/is_favourite_repo.dart';
import '../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';
import '../data/repos/products_page_repo.dart';
import '../logic/products_page_cubit/products_page_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductsPageCubit(ProductsPageRepo(ApiService(Dio())))
                ..emitProductsPageStates(Intl.getCurrentLocale()),
        ),
        BlocProvider(
          create: (context) =>
              IsFavouriteCubit(IsFavouriteRepo(ApiService(Dio()))),
        ),
      ],
      child: const ProductsScreenBody(),
    );
  }
}
