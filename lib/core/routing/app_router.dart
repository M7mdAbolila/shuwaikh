import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/account/data/repos/profile_repo.dart';
import 'package:shuwaikh/features/account/logic/cubit/profile_cubit.dart';
import 'package:shuwaikh/features/account/ui/account_screen.dart';
import 'package:shuwaikh/features/setting/setting_screen.dart';
import 'package:shuwaikh/features/update%20info/data/repos/update_profile_repo.dart';
import 'package:shuwaikh/features/update%20info/logic/update_billing_cubit/update_billing_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_shipping_cubit/update_shipping_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/update_profile_screen.dart';
import 'package:shuwaikh/features/cart/ui/cart_screen.dart';
import 'package:shuwaikh/features/favourites/ui/favourites_screen.dart';
import 'package:shuwaikh/features/login/data/repos/login_repo.dart';
import 'package:shuwaikh/features/login/logic/cubit/login_cubit.dart';
import 'package:shuwaikh/features/nav_bar/cubit/change_page_cubit.dart';
import 'package:shuwaikh/features/nav_bar/nav_bar_main_screen.dart';
import 'package:shuwaikh/features/offer/data/repos/offer_details_repo.dart';
import 'package:shuwaikh/features/offer/logic/cubit/offer_details_cubit.dart';
import 'package:shuwaikh/features/offer/ui/offer_screen.dart';
import 'package:shuwaikh/features/onboarding/on_boarding_screen.dart';
import 'package:shuwaikh/features/otp/ui/otp_screen.dart';
import 'package:shuwaikh/features/product_details/data/repos/product_details_repo.dart';
import 'package:shuwaikh/features/product_details/ui/product_details_screen.dart';
import 'package:shuwaikh/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:shuwaikh/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/update_dilling.dart';
import 'package:shuwaikh/features/update%20info/ui/update_shipping_screen.dart';
import '../../features/Products_page/data/repos/products_page_repo.dart';
import '../../features/Products_page/logic/cubit/change_category_cubit.dart';
import '../../features/Products_page/logic/products_page_cubit/products_page_cubit.dart';
import '../../features/cart/data/repos/add_to_cart_repo.dart';
import '../../features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/favourites/data/repos/get_favourite_repo.dart';
import '../../features/favourites/data/repos/is_favourite_repo.dart';
import '../../features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import '../../features/favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/product_details/logic/cubit/product_details_cubit.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
import '../../features/update info/data/repos/update_billing_repo.dart';
import '../../features/update info/data/repos/update_shipping_repo.dart';
import '../../features/vouncher/ui/voucher_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ProductsPageCubit(ProductsPageRepo(ApiService(Dio())))
                      ..emitProductsPageStates(Intl.getCurrentLocale()),
              ),
              BlocProvider(
                create: (context) => ChangeCategoryCubit()..getCategory(),
              ),
              BlocProvider(
                create: (context) => ChangePageCubit(),
              ),
            ],
            child: const MainScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(LoginRepo(ApiService(Dio()))),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(SignupRepo(ApiService(Dio()))),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.favourites:
        return MaterialPageRoute(
          builder: (_) => const FavouritesScreen(),
        );
      case Routes.account:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProfileCubit(ProfileRepo(ApiService(Dio())))..getProfileData(),
            child: const AccountScreen(),
          ),
        );

      case Routes.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoradingScreen(),
        );
      case Routes.voucherScreen:
        return MaterialPageRoute(
          builder: (_) => const VoucherScreen(),
        );
      case Routes.setting:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case Routes.updateBillingDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                UpdateBillingCubit(UpdateBillingRepo(ApiService(Dio()))),
            child: const UpdateBillingScreen(),
          ),
        );
      case Routes.updateShippingDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                UpdateShippingCubit(UpdateShippingRepo(ApiService(Dio()))),
            child: const UpdateShippingScreen(),
          ),
        );
      case Routes.updateProfile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                UpdateProfileCubit(UpdateProfileRepo(ApiService(Dio()))),
            child: const UpdateProfileScreen(),
          ),
        );
      case Routes.offerScreen:
        final id = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                OfferDetailsCubit(OfferDetailsRepo(ApiService(Dio()))),
            child: OfferScreen(
              id: id,
            ),
          ),
        );
      case Routes.productDetailsScreen:
        final id = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ProductDetailsCubit(ProductDetailsRepo(ApiService(Dio()))),
              ),
              BlocProvider(
                create: (context) =>
                    AddToCartCubit(AddToCartRepo(ApiService(Dio()))),
              ),
              BlocProvider(
                create: (context) =>
                    IsFavouriteCubit(IsFavouriteRepo(ApiService(Dio()))),
              ),
              BlocProvider(
                create: (context) =>
                    GetFavouriteCubit(GetFavouriteRepo(ApiService(Dio())))
                      ..getFavourites(),
              ),
            ],
            child: ProductDetailsScreen(id: id),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
