import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/home/data/repos/get_categories_repo.dart';
import 'package:shuwaikh/features/home/data/repos/get_offers_repo.dart';
import 'package:shuwaikh/features/home/logic/get_categories_cubit/get_categories_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import '../../drawer/drawer_screen.dart';
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
    return Scaffold(
      drawer: const CustomDrawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetCategoriesCubit(GetCategoriesRepo(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                GetOffersCubit(GetOffersRepo(ApiService(Dio()))),
          ),
        ],
        child: const HomeScreenBody(),
      ),
    );
  }
}
