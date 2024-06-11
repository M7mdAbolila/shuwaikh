import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';
import 'package:shuwaikh/features/cart/logic/remove_from_cart/remove_from_cart_cubit.dart';


class RemoveProductBlocListener extends StatelessWidget {
  const RemoveProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveFromCartCubit, RemoveFromCartState>(
      listener: (context, state) {
        if (state is RemoveFromCartSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
          context.read<GetCartCubit>().getCart();
        } else if (state is RemoveFromCartFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is RemoveFromCartLoading) {
          loadingDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
