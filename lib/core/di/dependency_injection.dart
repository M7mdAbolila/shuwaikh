import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shuwaikh/features/Products_page/data/repos/products_page_repo.dart';
import 'package:shuwaikh/features/Products_page/logic/products_page_cubit/products_page_cubit.dart';
import 'package:shuwaikh/features/account/data/repos/profile_repo.dart';
import 'package:shuwaikh/features/account/logic/cubit/profile_cubit.dart';
import 'package:shuwaikh/features/cart/data/repos/add_to_cart_repo.dart';
import 'package:shuwaikh/features/cart/data/repos/get_cart_repo.dart';
import 'package:shuwaikh/features/cart/data/repos/remove_from_cart_repo.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';
import 'package:shuwaikh/features/cart/logic/remove_from_cart/remove_from_cart_cubit.dart';
import 'package:shuwaikh/features/checkout/data/repos/order_repo.dart';
import 'package:shuwaikh/features/checkout/data/repos/shipping_charge_repo.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';
import 'package:shuwaikh/features/favourites/data/repos/get_favourite_repo.dart';
import 'package:shuwaikh/features/favourites/data/repos/is_favourite_repo.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';
import 'package:shuwaikh/features/home/data/repos/get_categories_repo.dart';
import 'package:shuwaikh/features/home/data/repos/get_coupons_repo.dart';
import 'package:shuwaikh/features/home/data/repos/get_offers_repo.dart';
import 'package:shuwaikh/features/home/logic/get_categories_cubit/get_categories_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_coupons_cubit/get_coupons_cubit.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import 'package:shuwaikh/features/login/data/repos/login_with_socail_repo.dart';
import 'package:shuwaikh/features/login/logic/login_with_social_cubit/login_with_socail_cubit.dart';
import 'package:shuwaikh/features/logout/data/repos/logout_repo.dart';
import 'package:shuwaikh/features/logout/logic/cubit/logout_cubit.dart';
import 'package:shuwaikh/features/my_orders/data/repos/my_orders_repo.dart';
import 'package:shuwaikh/features/my_orders/logic/cubit/my_orders_cubit.dart';
import 'package:shuwaikh/features/offer/data/repos/offer_details_repo.dart';
import 'package:shuwaikh/features/offer/logic/cubit/offer_details_cubit.dart';
import 'package:shuwaikh/features/product_details/data/repos/product_details_repo.dart';
import 'package:shuwaikh/features/product_details/logic/product_details_cubit/product_details_cubit.dart';
import 'package:shuwaikh/features/setting/data/repos/delete_account_repo.dart';
import 'package:shuwaikh/features/setting/logic/cubit/delete_account_cubit.dart';
import 'package:shuwaikh/features/update%20info/data/repos/update_billing_repo.dart';
import 'package:shuwaikh/features/update%20info/data/repos/update_profile_repo.dart';
import 'package:shuwaikh/features/update%20info/data/repos/update_shipping_repo.dart';
import 'package:shuwaikh/features/update%20info/logic/update_billing_cubit/update_billing_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_shipping_cubit/update_shipping_cubit.dart';
import 'package:shuwaikh/features/vouncher/data/repos/check_coupon_repo.dart';
import 'package:shuwaikh/features/vouncher/logic/cubit/check_coupon_cubit.dart';

import '../../features/checkout/logic/shipping_charge_cubit/shipping_charge_cubit.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/login_cubit/login_cubit.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../../features/sign_up/logic/cubit/signup_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // login with socail
  getIt.registerLazySingleton<LoginWithSocailRepo>(
      () => LoginWithSocailRepo(getIt()));
  getIt.registerFactory<LoginWithSocailCubit>(
      () => LoginWithSocailCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // get categories
  getIt.registerLazySingleton<GetCategoriesRepo>(
      () => GetCategoriesRepo(getIt()));
  getIt.registerLazySingleton<GetCategoriesCubit>(
      () => GetCategoriesCubit(getIt()));

  // get Coupons
  getIt.registerLazySingleton<GetCouponsRepo>(() => GetCouponsRepo(getIt()));
  getIt.registerLazySingleton<GetCouponsCubit>(() => GetCouponsCubit(getIt()));

  // get products page
  getIt
      .registerLazySingleton<ProductsPageRepo>(() => ProductsPageRepo(getIt()));
  getIt.registerLazySingleton<ProductsPageCubit>(
      () => ProductsPageCubit(getIt()));
  // isFavorite
  getIt.registerLazySingleton<IsFavouriteRepo>(() => IsFavouriteRepo(getIt()));
  getIt
      .registerLazySingleton<IsFavouriteCubit>(() => IsFavouriteCubit(getIt()));

  // get offers
  getIt.registerLazySingleton<GetOffersRepo>(() => GetOffersRepo(getIt()));
  getIt.registerLazySingleton<GetOffersCubit>(() => GetOffersCubit(getIt()));

  // get favouraties
  getIt
      .registerLazySingleton<GetFavouriteRepo>(() => GetFavouriteRepo(getIt()));
  getIt.registerFactory<GetFavouriteCubit>(() => GetFavouriteCubit(getIt()));

  // product details
  getIt.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepo(getIt()));
  getIt
      .registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(getIt()));

  // get cart
  getIt.registerLazySingleton<GetCartRepo>(() => GetCartRepo(getIt()));
  getIt.registerFactory<GetCartCubit>(() => GetCartCubit(getIt()));

  // place order
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));
  getIt.registerFactory<PlaceOrderCubit>(() => PlaceOrderCubit(getIt()));

  // remove from cart
  getIt.registerLazySingleton<RemoveFromCartRepo>(
      () => RemoveFromCartRepo(getIt()));
  getIt
      .registerFactory<RemoveFromCartCubit>(() => RemoveFromCartCubit(getIt()));

  // Shipping Charge
  getIt.registerLazySingleton<ShippingChargeRepo>(
      () => ShippingChargeRepo(getIt()));
  getIt
      .registerFactory<ShippingChargeCubit>(() => ShippingChargeCubit(getIt()));

  // check coupon
  getIt.registerLazySingleton<CheckCouponRepo>(() => CheckCouponRepo(getIt()));
  getIt
      .registerLazySingleton<CheckCouponCubit>(() => CheckCouponCubit(getIt()));

  // my orders
  getIt.registerLazySingleton<MyOrdersRepo>(() => MyOrdersRepo(getIt()));
  getIt.registerFactory<MyOrdersCubit>(() => MyOrdersCubit(getIt()));

  // update billing details
  getIt.registerLazySingleton<UpdateBillingRepo>(
      () => UpdateBillingRepo(getIt()));
  getIt.registerLazySingleton<UpdateBillingCubit>(
      () => UpdateBillingCubit(getIt()));

  // update shipping details
  getIt.registerLazySingleton<UpdateShippingRepo>(
      () => UpdateShippingRepo(getIt()));
  getIt.registerLazySingleton<UpdateShippingCubit>(
      () => UpdateShippingCubit(getIt()));

  // profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));

  // update profile
  getIt.registerLazySingleton<UpdateProfileRepo>(
      () => UpdateProfileRepo(getIt()));
  getIt.registerLazySingleton<UpdateProfileCubit>(
      () => UpdateProfileCubit(getIt()));

  // offer details
  getIt
      .registerLazySingleton<OfferDetailsRepo>(() => OfferDetailsRepo(getIt()));
  getIt.registerFactory<OfferDetailsCubit>(() => OfferDetailsCubit(getIt()));

  // add to cart
  getIt.registerLazySingleton<AddToCartRepo>(() => AddToCartRepo(getIt()));
  getIt.registerFactory<AddToCartCubit>(() => AddToCartCubit(getIt()));

  // logout
  getIt.registerLazySingleton<LogoutRepo>(() => LogoutRepo(getIt()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt()));

  // delete account
  getIt.registerLazySingleton<DeleteAccountRepo>(
      () => DeleteAccountRepo(getIt()));
  getIt.registerLazySingleton<DeleteAccountCubit>(
      () => DeleteAccountCubit(getIt()));
}
