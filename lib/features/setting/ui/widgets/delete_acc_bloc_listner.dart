import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/setting/logic/cubit/delete_account_cubit.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/setup_dialogs.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/routing/routes.dart';

class DeleteAccBlocListner extends StatelessWidget {
  const DeleteAccBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) async {
        if (state is DeleteAccountLoading) {
          loadingDialog(context);
        } else if (state is DeleteAccountSuccess) {
          context.pop();
          await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
          await SharedPrefHelper.clearAllData();
          customSnackBar(context, state.message, false);
          context.pushNamedAndRemoveUntil(
            Routes.onBoarding,
            predicate: (Route<dynamic> route) => false,
          );
        } else if (state is DeleteAccountFailure) {
          context.pop();
          errorDialog(
            context,
            state.errMessage,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
