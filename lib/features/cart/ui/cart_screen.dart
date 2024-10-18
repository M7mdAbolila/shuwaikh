import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/di/dependency_injection.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';
import 'package:shuwaikh/features/cart/logic/remove_from_cart/remove_from_cart_cubit.dart';

import 'widgets/cart_screen_body.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCartCubit>()..getCart(),
        ),
        BlocProvider(
          create: (context) => getIt<RemoveFromCartCubit>(),
        ),
      ],
      child: const CartScreenBody(),
    );
  }
}
