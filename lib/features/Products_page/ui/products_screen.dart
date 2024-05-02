import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/Products_page/data/repos/products_page_repo.dart';
import 'package:shuwaikh/features/Products_page/logic/cubit/change_category_cubit.dart';
import 'package:shuwaikh/features/Products_page/logic/products_page_cubit/products_page_cubit.dart';

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
            ProductsPageCubit(ProductsPageRepo(ApiService(Dio()))),
      ),
      BlocProvider(
        create: (context) => ChangeCategoryCubit(),
      ),
    ], child: const ProductsScreenBody());
  }
}
