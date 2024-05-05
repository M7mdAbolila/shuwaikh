import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) {
          SystemNavigator.pop();
        },
        child: const LoginScreenBody(),
      ),
    );
  }
}
