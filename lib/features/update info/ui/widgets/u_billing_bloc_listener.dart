import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import '../../logic/update_billing_cubit/update_billing_cubit.dart';

class UpdateBillingBlocListener extends StatelessWidget {
  const UpdateBillingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateBillingCubit, UpdateBillingState>(
      listener: (context, state) async {
        if (state is UpdateBillingSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
          await UserInfoCachceHelper.cacheUserBillingInfo(
            billFname: context.read<UpdateBillingCubit>().fname.text,
            billLname: context.read<UpdateBillingCubit>().lname.text,
            billAddress: context.read<UpdateBillingCubit>().address.text,
            billEmail: context.read<UpdateBillingCubit>().email.text,
            billNumber: context.read<UpdateBillingCubit>().number.text,
            billCity: context.read<UpdateBillingCubit>().city.text,
          );
        } else if (state is UpdateBillingFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is UpdateBillingLoading) {
          loadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
