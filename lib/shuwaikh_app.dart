import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/routing/app_router.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/theming/colors.dart';

class ShuwaikhApp extends StatelessWidget {
  const ShuwaikhApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Shuwaikh',
        theme: ThemeData(
          primaryColor: ColorsManger.blue,
          fontFamily: kFontFamily,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}
