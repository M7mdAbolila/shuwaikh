import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import '../../logic/update_shipping_cubit/update_shipping_cubit.dart';

class UpdateShippingBlocListener extends StatelessWidget {
  const UpdateShippingBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateShippingCubit, UpdateShippingState>(
      listener: (context, state) async {
        if (state is UpdateShippingSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
          await UserInfoCachceHelper.cacheUserShippingInfo(
            shFname: context.read<UpdateShippingCubit>().fname.text,
            shLname: context.read<UpdateShippingCubit>().lname.text,
            shAddress: context.read<UpdateShippingCubit>().address.text,
            shCity: context.read<UpdateShippingCubit>().city.text,
            shEmail: context.read<UpdateShippingCubit>().email.text,
            shNumber: context.read<UpdateShippingCubit>().number.text,
          );
        } else if (state is UpdateShippingFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is UpdateShippingLoading) {
          loadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
