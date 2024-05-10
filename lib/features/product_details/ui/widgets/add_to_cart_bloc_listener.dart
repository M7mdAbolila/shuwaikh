import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';

import '../../../../core/theming/colors.dart';

class AddToCartBlocListener extends StatelessWidget {
  const AddToCartBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
        } else if (state is AddToCartFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is AddToCartLoading) {
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
