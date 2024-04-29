import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/cart/ui/cart_screen.dart';
import 'package:shuwaikh/features/login/data/repos/login_repo.dart';
import 'package:shuwaikh/features/login/logic/cubit/login_cubit.dart';
import 'package:shuwaikh/features/nav%20bar/nav_bar_main_screen.dart';
import 'package:shuwaikh/features/onboarding/on_boarding_screen.dart';
import 'package:shuwaikh/features/otp/ui/otp_screen.dart';
import 'package:shuwaikh/features/product_details/ui/product_details_screen.dart';
import 'package:shuwaikh/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:shuwaikh/features/sign_up/logic/cubit/signup_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
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
          builder: (_) => const MainScreen(),
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
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsScreen(),
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
