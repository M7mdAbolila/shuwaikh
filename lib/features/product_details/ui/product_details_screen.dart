import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/product_details/logic/cubit/calc_total_cubit.dart';

import 'widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: BlocProvider(
        create: (context) => CalcTotalCubit(),
        child: ProductDetailsScreenBody(
          id: id,
        ),
      ),
    );
  }
}
