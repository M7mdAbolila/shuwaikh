import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/update_shipping_cubit/update_shipping_cubit.dart';

class UpdateShippingBlocListener extends StatelessWidget {
  const UpdateShippingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateShippingCubit, UpdateShippingState>(
      listener: (context, state) {
        if (state is UpdateShippingSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
        } else if (state is UpdateShippingFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is UpdateShippingLoading) {
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
