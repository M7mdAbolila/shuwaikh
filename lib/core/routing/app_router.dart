import 'package:flutter/material.dart';
import 'package:shuwaikh/features/nav%20bar/nav_bar_screen.dart';
import 'package:shuwaikh/features/onboarding/on_boarding_screen.dart';
import 'package:shuwaikh/features/otp/ui/otp_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => const NavBarSrceen(),
        );
        case Routes.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
        case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoradingScreen(),
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
