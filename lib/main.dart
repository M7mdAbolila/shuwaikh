import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/core/routing/app_router.dart';
import 'package:shuwaikh/shuwaikh_app.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
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
