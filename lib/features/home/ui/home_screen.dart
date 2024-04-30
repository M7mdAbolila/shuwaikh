import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/home/data/repos/home_repo_impl.dart';
import 'package:shuwaikh/features/home/logic/cubit/get_categories_cubit.dart';
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
                GetCategoriesCubit(HomeRepoImpl(ApiService(Dio()))),
          ),
        ],
        child: const HomeScreenBody(),
      ),
    );
  }
}
