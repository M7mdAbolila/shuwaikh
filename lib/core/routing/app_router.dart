import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/account/ui/account_screen.dart';
import 'package:shuwaikh/features/checkout/data/models/checkout_arguments.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';
import 'package:shuwaikh/features/checkout/logic/shipping_charge_cubit/shipping_charge_cubit.dart';
import 'package:shuwaikh/features/checkout/ui/checkout_screen.dart';
import 'package:shuwaikh/features/login/logic/login_with_social_cubit/login_with_socail_cubit.dart';
import 'package:shuwaikh/features/my_orders/logic/cubit/my_orders_cubit.dart';
import 'package:shuwaikh/features/my_orders/ui/my_orders_screen.dart';
import 'package:shuwaikh/features/setting/logic/cubit/delete_account_cubit.dart';
import 'package:shuwaikh/features/setting/ui/setting_screen.dart';
import 'package:shuwaikh/features/update%20info/logic/update_billing_cubit/update_billing_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_shipping_cubit/update_shipping_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/update_profile_screen.dart';
import 'package:shuwaikh/features/cart/ui/cart_screen.dart';
import 'package:shuwaikh/features/favourites/ui/favourites_screen.dart';
import 'package:shuwaikh/features/login/logic/login_cubit/login_cubit.dart';
import 'package:shuwaikh/features/nav_bar/cubit/change_page_cubit.dart';
import 'package:shuwaikh/features/nav_bar/nav_bar_main_screen.dart';
import 'package:shuwaikh/features/offer/logic/cubit/offer_details_cubit.dart';
import 'package:shuwaikh/features/offer/ui/offer_screen.dart';
import 'package:shuwaikh/features/onboarding/on_boarding_screen.dart';
import 'package:shuwaikh/features/otp/ui/otp_screen.dart';
import 'package:shuwaikh/features/product_details/ui/product_details_screen.dart';
import 'package:shuwaikh/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/update_billing.dart';
import 'package:shuwaikh/features/update%20info/ui/update_shipping_screen.dart';
import 'package:shuwaikh/features/vouncher/logic/cubit/check_coupon_cubit.dart';
import '../../features/Products_page/logic/change_category_cubit/change_category_cubit.dart';
import '../../features/Products_page/ui/products_screen.dart';
import '../../features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/product_details/logic/product_details_cubit/product_details_cubit.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
import '../../features/vouncher/ui/voucher_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
              ),
               BlocProvider(
                create: (context) => getIt<LoginWithSocailCubit>(),
              ),
            ],
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.productsPage:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
        );
      case Routes.favourites:
        return MaterialPageRoute(
          builder: (_) => const FavouritesScreen(),
        );
      case Routes.account:
        return MaterialPageRoute(
          builder: (_) => const AccountScreen(),
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
      case Routes.checkoutScreen:
        final arguments = settings.arguments as CheckoutArguments;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<PlaceOrderCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ShippingChargeCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<CheckCouponCubit>(),
              ),
            ],
            child: CheckoutScreen(
              arguments: arguments,
            ),
          ),
        );
      case Routes.setting:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DeleteAccountCubit>(),
            child: const SettingScreen(),
          ),
        );
      case Routes.myOrdersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MyOrdersCubit>()..getMyOrders(),
            child: const MyOrdersScreen(),
          ),
        );
      case Routes.updateBillingDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UpdateBillingCubit>(),
            child: const UpdateBillingScreen(),
          ),
        );
      case Routes.updateShippingDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UpdateShippingCubit>(),
            child: const UpdateShippingScreen(),
          ),
        );
      case Routes.updateProfile:
        final photo = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UpdateProfileCubit>(),
            child: UpdateProfileScreen(
              photo: photo,
            ),
          ),
        );
      case Routes.offerScreen:
        final id = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OfferDetailsCubit>(),
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
                create: (context) => getIt<ProductDetailsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AddToCartCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<IsFavouriteCubit>(),
              ),
            ],
            child: ProductDetailsScreen(id: id),
          ),
        );
      default:
        return null;
    }
  }
}
