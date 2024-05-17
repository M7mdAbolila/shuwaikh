import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';

import '../../../checkout/logic/place_order_cubit/place_order_cubit.dart';

class OrderBlocListener extends StatelessWidget {
  const OrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaceOrderCubit, PlaceOrderState>(
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          context.read<GetCartCubit>().getCart();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
