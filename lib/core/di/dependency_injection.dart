import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shuwaikh/features/cart/data/repos/get_cart_repo.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';
import 'package:shuwaikh/features/checkout/data/repos/order_repo.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // get cart
  getIt.registerLazySingleton<GetCartRepo>(() => GetCartRepo(getIt()));
  getIt.registerFactory<GetCartCubit>(() => GetCartCubit(getIt()));

  // place order
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));
  getIt.registerFactory<PlaceOrderCubit>(() => PlaceOrderCubit(getIt()));

  // reload products
  // getIt.registerFactory<ReloadFavouritesCubit>(() => ReloadFavouritesCubit());
}
