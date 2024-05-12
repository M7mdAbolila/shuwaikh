import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/update_billing_cubit/update_billing_cubit.dart';

class UpdateBillingBlocListener extends StatelessWidget {
  const UpdateBillingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateBillingCubit, UpdateBillingState>(
      listener: (context, state) {
        if (state is UpdateBillingSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
        } else if (state is UpdateBillingFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is UpdateBillingLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.blue,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
