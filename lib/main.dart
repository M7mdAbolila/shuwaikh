import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/routing/app_router.dart';
import 'package:shuwaikh/shuwaikh_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  // const String trialEndDate = '2024-10-10';
  // DateTime currentDate = DateTime.now();
  // DateTime endDate = DateFormat('yyyy-MM-dd').parse(trialEndDate);
  // bool isTrialExpired = currentDate.isAfter(endDate);
  // if (!isTrialExpired) {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();
  runApp(
    ShuwaikhApp(
      appRouter: AppRouter(),
    ),
  );
  // } else {
  //   runApp(const TrialPeriodEnded());
  // }
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}

class TrialPeriodEnded extends StatelessWidget {
  const TrialPeriodEnded({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Trial Checker'),
        ),
        body: const Center(
          child: Text('انتهت النسخة التجريبية'),
        ),
      ),
    );
  }
}
