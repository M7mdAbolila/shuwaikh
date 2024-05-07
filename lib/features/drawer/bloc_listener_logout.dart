import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/features/logout/logic/cubit/logout_cubit.dart';

import '../../core/theming/styles.dart';

class BlocListenerLogout extends StatelessWidget {
  const BlocListenerLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) async {
        if (state is LogoutSuccess) {
          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setBool('isLogin', false);
          context.pushNamedAndRemoveUntil(Routes.onBoarding,
              predicate: (Route<dynamic> route) => false);
        } else if (state is LogoutFailure) {
          setupErrorState(
            context,
            state.errMessage ?? '',
          );
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(child: CircularProgressIndicator());
              });
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font18Blue500Weight,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font13Black500Weight,
            ),
          ),
        ],
      ),
    );
  }
}
