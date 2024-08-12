import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';
import 'package:shuwaikh/core/helpers/shared_pref_helper.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/features/logout/logic/cubit/logout_cubit.dart';

class BlocListenerLogout extends StatelessWidget {
  const BlocListenerLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) async {
        if (state is LogoutSuccess) {
          SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
          SharedPrefHelper.clearAllData();
          context.pushNamedAndRemoveUntil(
            Routes.onBoarding,
            predicate: (Route<dynamic> route) => false,
          );
        } else if (state is LogoutFailure) {
          errorDialog(
            context,
            state.errMessage ?? '',
          );
        } else {
          loadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
