import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/di/dependency_injection.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/routing/app_router.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/drawer/logic/username_cubit.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/localization/cubit/locale_cubit.dart';
import 'features/Products_page/logic/cubit/reload_favourites_cubit.dart';
import 'features/account/logic/cubit/profile_cubit.dart';
import 'features/update info/logic/update_profile_cubit/update_profile_cubit.dart';
import 'generated/l10n.dart';

class ShuwaikhApp extends StatelessWidget {
  const ShuwaikhApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsernameAndPhotoCubit()..getUsernameAndPhoto(),
        ),
        BlocProvider(
          create: (context) => ReloadFavouritesCubit(),
        ),
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => getIt<GetFavouriteCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UpdateProfileCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              locale: state.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Shuwaikh',
              theme: ThemeData(
                primaryColor: AppColors.blue,
                fontFamily: 'Quicksand',
                scaffoldBackgroundColor: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute:
                  isLoggedInUser ? Routes.mainScreen : Routes.onBoarding,
            ),
          );
        },
      ),
    );
  }
}
