import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/core/routing/app_router.dart';
import 'package:shuwaikh/shuwaikh_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final isLogin = sharedPreferences.getBool('isLogin') ?? false;
  runApp(
    ShuwaikhApp(
      isLogin: isLogin,
      appRouter: AppRouter(),
    ),
  );
}
